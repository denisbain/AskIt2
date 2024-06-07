class UserBulkImportService < ApplicationService
  attr_reader :archive_key, service

  def initialize(archive_key)
    @archive_key = archive_key
    @service = ActiveStorage::Blob.service
  end

  def call
    read_zip_entries do |entry|
      entry.get_input_stream do |f|
        User.import users_from(f.read), ignore: true
        f.close
      end
    end
  ensure
    # После того как архив отработал он удаляется.
    service.delete archive_key
  end

  private

  def read_zip_entries
    return unless block_given?
    # Отдельный метод, который будет выполнять стриминг загруженного файла zip.
    stream zip_stream
    loop do
      entry = stream.get_next_entry

      break unless entry
      next unless entry.name.end_with? '.xlsx'
      # Entry передается в call.
      yield entry
    end
  ensure
    stream.close
  end

  def zip_stream
    # Путь к запрошенному архиву берется с помощью archive_key.
    f = File.open service.path_for(archive_key)
    stream = Zip::InputStream.new(f)
    # Если не закрыть файл, то удалить его не получится.
    f.close
    stream
  end
  def users_from(data)
    sheet = RubyXL::Parser.parse_buffer(data)[0]
    sheet.map do |row|
      cells = row.cells
      User.new name: cells[0].value,
               email: cells[1].value,
               password: cells[2].value,
               password_confirmation: cells[2].value
    end
  end
end
