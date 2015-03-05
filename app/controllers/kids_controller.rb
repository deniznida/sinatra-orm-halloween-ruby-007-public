class KidsController < HalloweenController
  get '/kids' do
    @kids = Kid.all
    erb :'kids/index'
  end

  get '/kids/new' do
    @kids = Kid.all
    erb :'kids/new'
  end

  post '/kids' do
    kid = Kid.create(params[:kid])
    kid.bucket = Bucket.create
    redirect "/kids/#{kid.id}"
  end

  get '/kids/:id' do
    @kid = Kid.find(params[:id])
    if @kid.bucket
      @candies = @kid.bucket.candies
    else
      @candies = []
    end
    erb :'kids/show'
  end

  patch '/kids/:id/pig-out' do
    kid = Kid.find(params[:id])
    kid.pig_out(params[:consumption])
    redirect "/kids/#{params[:id]}"
  end
end