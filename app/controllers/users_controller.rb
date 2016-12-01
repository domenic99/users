# @resource Users API
#
# This document describes the API for creating, and reading user accounts.
#

class UsersController < ApplicationController
  ##
  # Creates a new user for the given data
  #
  # @path [POST] /users
  # @parameter email(required)    [string]     Email address for the new user, needs to be unique.
  # @parameter name               [string]     Full name of the user.
  # @parameter password(required) [string]     Password for the user.
  #
  # @response_type [User]
  #
  # @error_message 422 User data invalid
  def create
    user = User.create(user_id: UUIDTools::UUID.random_create,
                       email: params[:email],
                       name: params[:name],
                       password: params[:password])
    # TODO use active_model_serializers
    if user.valid?
      render json: user.to_hash
    else
      render json: {errors: user.errors }, status: :unprocessable_entity
    end

  end

  ##
  # Returns a user's data for a given user by uuid
  #
  # @path [GET] /users/{id}
  # @response_type [User]
  #
  # @error_message 404 User not found
  #
  def show
    user = User.find(params[:id])
    if stale?(etag: user, last_modified: user.created_at.utc)
     render json: user.to_hash
     expires_in 5.minutes, public: true
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "no user with ID #{params[:id]}"}, status: 404
  end

  ##
  # Returns all users' data
  #
  # @path [GET] /users
  # @response_type [array<User>]
  #
  def index
    render json: User.all.map(&:to_hash)
  end
end
