module Admin
  class UsersController < BaseController
    before_action :require_authentication
    before_action :set_user!, only: %i[edit update destroy]
    before_action :authorize_user!
    after_action :verify_authorized

    def index
      respond_to do |format|
        format.html do
          @pagy, @users = pagy User.order(created_at: :desc)
        end

        format.zip { respond_with_zipped_users }
      end
    end

    def create
      if params[:archive].present?
        # ActiveStorage предоставляет интерфейс,
        # через который можно сохранить файл в разные хранилища.
        UserBulkImportJob.perform_later create_blob, current_user
        flash[:success] = 'User imported!'
      end

      redirect_to admin_users_path
    end

    def edit

    end

    def update
      if @user.update user_params
        flash[:success] = t '.success'
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash[:success] = t '.success'
      redirect_to admin_users_path
    end
    private

    # Создание нового объекта в ActiveStorage.
    def create_blob
      file = File.open params[:archive]
      # io - input, output.
      result = ActiveStorage::Blob.create_and_upload! io: file, filename: params[:archive].original_filename
      file.close
      result.key
    end

    def respond_with_zipped_users
      compressed_filestream = Zip::OutputStream.write_buffer do |zos|
        User.order(created_at: :desc).each do |user|
          zos.put_next_entry "user_#{user.id}.xlsx"
          zos.print render_to_string(
            layout: false, handlers: [:axlsx], formats: [:xlsx],
            template: 'admin/users/user',
            locals: { user: user }
          )
        end
      end
      compressed_filestream.rewind
      send_data compressed_filestream.read, filename: 'users.zip'
    end
    def set_user!
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation, :role).merge(admin_edit: true)
    end

    def authorize_user!
      current_user
      authorize(@user || User)
    end
  end
end
