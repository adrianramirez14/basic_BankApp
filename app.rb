require 'sinatra'
require 'sinatra/reloader'



configure do
    enable :sessions

    set :name, "yuan"
    set :password, "123"
    set :accountnum, "123321"
    set :balance, "0"
end


get '/' do
    erb :homepage #index.erb under /views
end

get '/createaccount' do
   erb :createacc #createacc.erb under /views
end

post '/login' do
    settings.name = params[:name]
    settings.password = params[:pass]
    settings.accountnum = params[:acnum]
    settings.balance = "0"

    redirect '/viewacc'
end

get '/deposit' do
    erb :depo #depo.erb under /views
end

post '/depo' do
    if params[:name] == settings.name && params[:pass] == settings.password && params[:acnum] == settings.accountnum
        settings.balance = params[:amoun]
        redirect '/viewacc'
    else
        puts("Incorrect info")
        redirect '/deposit'
    end
end

get '/withdraw' do
    erb :withdr #withdr.erb /views
end

post '/withdraw' do
    if params[:name] == settings.name && params[:pass] == settings.password && params[:acnum] == settings.accountnum
        settings.balance = (settings.balance.to_i - params[:amoun].to_i).to_s
        redirect '/viewacc'
    else
        puts("Incorrect info")
        redirect '/withdraw'
    end
end

get '/viewacc' do
    erb :viewacc
end