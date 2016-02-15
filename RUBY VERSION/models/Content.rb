require 'mongoid'

class Content
	include Mongoid::Document

	field :uid, as: :userid
	field :ip
	field :cid, as: :contentid
	field :c, as: :content
	field :t, as: :time, type: Time
    embeds_many :metrics 
end

class Metric
    include Mongoid::Document

    field :mid, as: :metricid
    field :ms, as: :metricstring
    field :uid, as: :userid
    field :ip
    field :cc, as: :codecontent
    field :ct, as: :codetime, type: Time
    embedded_in :content
end