get '/' do
  @people = People.all
  erb :index
end

get '/people/new' do
  if request.xhr?
    erb :_people_new_form, layout: false
  else
    erb :people_new
  end
end

post '/people' do
  @new_person = People.create(params[:people])
  if request.xhr?
    erb :_people_display_person, layout: false
  else
    redirect '/'
  end
end

get '/people/:id' do
  @person = People.find(params[:id])
  erb :people_show
end

get '/people/:id/edit' do
  @person = People.find(params[:id])
  erb :people_edit
end

post '/people/:id/edit' do
  @person = People.find(params[:id])
  @person.update_attributes(params[:people])
  redirect "/people/#{@person.id}"
end

get '/people/:id/delete' do
  @person = People.find(params[:id])
  @person.destroy
  if request.xhr?
    "#{@person.name} deleted!"
  else
    redirect '/'
  end
end
