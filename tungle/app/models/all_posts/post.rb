class Post

	attr_accessor :post_date, :url, :source

	belongs to :user  
	belongs to :blog
	has_many :tags

	field :source
	field :note_count
	field :post_date
	field :url # this is a custom post URL
	field :state #this is if a post is queued


	def initialize()
		note_count: 0
		url: generate_url unless defined?(self.url)
		source: user.url unless defined?(self.source)
		defined?(self.post_date) ? state: "queued" : state: "posted" && post_date: Time.now
	end
end