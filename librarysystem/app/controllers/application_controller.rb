class ApplicationController < ActionController::Base

	# def current_ability
	#   @current_ability ||= Ability.new(current_user)
	# end
	devise_group :all, contains: [:librarian, :admin, :student]
	devise_group :manager, contains: [:librarian, :admin]
	devise_group :unadmin,contains: [:librarian,:student]
	devise_group :unlibrarian,contains: [:admin,:student]

	protected

	
 
	# def authenticate_admin
	#   unless current_user.admin?
	#     flash[:alert] = "You need to be an Admin to do this."
	#     redirect_to root_path
	#   end
	# end

	# def authenticate_librarian
	#   unless current_user.librarian?
	#     flash[:alert] = "You need to be a Librarian or Admin to do this."
	#     redirect_to root_path
	#   end
	# end

	# def authenticate_student
	#   unless current_user.student?
	#     flash[:alert] = "You need to sign up as a student to do this."
	#     redirect_to root_path
	#   end
	# end

end
