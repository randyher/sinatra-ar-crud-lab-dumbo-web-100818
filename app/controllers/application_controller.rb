
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # get '/posts/:id/edit' do
  #   @post = Post.find(params[:id])
  #   erb :edit
  # end

  post '/posts' do
    Post.create(params)

    erb :index
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.update(name: params[:name], content: params[:content])

    redirect to "/posts/#{ @post.id }"
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.delete
    erb :delete
  end

end
