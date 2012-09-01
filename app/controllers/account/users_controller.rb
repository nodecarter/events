class Account::UsersController < Account::ApplicationController
  def edit

  end

  def update
    if current_user.update_attributes(params[:account_user])
      redirect_to account_root_url,
                  notice: t("account.users.update.account_updated")
    else
      render action: :edit, flash: { error: t("account.users.update.failed") }
    end
  end

  def destroy
    if current_user.destroy
      sign_out
      redirect_to root_url, notice: t("account.destroy.account_deleted")
    else
      redirect_to account_root, flash: { error: current_user.errors.full_messages }
    end
  end
end
