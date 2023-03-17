class HomeController < ApplicationController
  PUBLIC_FOLDER = ['misc', 'proposals', 'publications']
  def search
    @query = params[:query]
    @results = []
    @search_models = search_models
    PUBLIC_FOLDER.each do |folder|
      Dir.glob(Rails.root.join('public', folder, '**', '*.{pdf,doc,docx}')).each do |path|
        if path.downcase.match(@query.downcase)
          @results << {
            type: 'File',
            title: File.basename(path),
            path: '/' + path.sub("#{Rails.root}/public/", '')
          }
        end
      end
    end
    render 'home/search'
  end

  private

  def search_models
    clipping_results = Clipping.clipping_search(@query)
    link_results = Link.link_search(@query)
    presentation_results = Presentation.presentation_search(@query)
    proposal_results = Proposal.proposal_search(@query)
    pub_results = Pub.publication_search(@query)
    video_results = Video.video_search(@query)

    clipping_results + link_results + presentation_results + proposal_results + pub_results + video_results
  end
end
