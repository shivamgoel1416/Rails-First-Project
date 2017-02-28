class Admin::TagsController < Admin::ApplicationController
  
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_params[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: 'Tag created successfully.'
  end

  def show
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tags_params)
      redirect_to new_admin_tag_url, notice: "Tag updated successfully."
    else
      flash[:alert] = "Problem in updating tag."
      render('edit')    
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.in_use? == "Not In Use"
      @tag.destroy
      redirect_to new_admin_tag_url, notice: "Tag deleted successfully."
    else
      flash[:alert] = "Tag Cannot be deleted."
    end
  end

  private

  def tags_params
    params.require(:tag).permit(:id,:name)
  end
end
