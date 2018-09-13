class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate_user!
    return if current_user.present?
    flash[:danger] = t "form.require_login"
    redirect_to login_path
  end

  def authenticate_suppervisor!
    return if current_user.is_suppervisor?
    flash[:danger] = t "form.cant_access"
    redirect_to login_path
  end

  def load_subjects
    @subjects = CourseSubject.subjects_on_course @course.id
  end

  def load_trainees
    @trainees = UserCourse.user_on_course_with_a_role @course.id,
      User.trainee
  end

  def load_suppervisors
    @suppervisors = UserCourse.user_on_course_with_a_role @course.id,
      User.suppervisor
  end
end
