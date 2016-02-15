require 'sinatra'
require 'sinatra/reloader'
require 'mongoid'
require './models/Content.rb'

class Application < Sinatra::Base

configure do
	Mongoid.load!("./mongoid.yml")
#	Mongoid.purge!
end

get '/' do
	erb :pag
end

post '/execute' do
	content = params[:content]
	userid = params[:userid]
	ip = params[:ip]
	thing = Content.new(
			ip: ip, userid: userid, content: content, time: Time.now)
	thing.save
	puts "<b>Thank you for your submission</b></br></br> IP: #{ip} </br> UserID: #{userid}, </br> Content: #{content}"
end

get '/get' do
	content = Content.order_by(:ip.asc, :userid.asc, :time.asc)
	string = ""
	content.each do |c|
		string += "<b>#{c[:ip]}, #{c[:userid]}, #{c[:time]} </b></br></br> #{c[:content]} </br></br></br></br>"
	end
	"#{string}"
end

get '/mile' do
	#first milestone
	id = "1"
	metric = "def main exists"
	if Content.where(content: /def&nbsp;main/).exists?
		test = Content.where(content: /def&nbsp;main/).first
		string = test[:content]
		time = test[:time]
	else
		string = "null"
		time = "null"
	end
	thing1 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
	thing1.save

	#second milestone
	id = "2"
	metric = "left_standing defined"
	content = Content.all
	bool = false
	re=('.*?'+'(def)'+'.*?'+'(left_standing)'+'.*?'+'(\\()'+'.*?'+'((?:[a-z][a-z]+))'+'.*?'+'(,)'+'.*?'+'((?:[a-z][a-z]+))'+'.*?'+'(\\))')
	m=Regexp.new(re,Regexp::IGNORECASE);
	content.each do |c|
		txt = c[:content]
		if !bool and m.match(txt)
		    string = txt
		    time = c[:time]
		    bool = true
		end
	end
	if !bool
		string = "null"
		time = "null"
	end
	thing2 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
	thing2.save

	#third milestone
	id = "3"
	metric = "left_standing called first time"
	content = Content.all
	bool = false
	if !Content.where(content: /def&nbspleft_standing/).exists? #if the function isn't yet defined,
		#look for a left_standing anywhere within main
		re=('.*?'+'(main)'+'.*?'+'(left_standing)')
		m=Regexp.new(re,Regexp::IGNORECASE);
		content.each do |c|
			txt = c[:content]
			if !bool and m.match(txt)
			    string = txt
			    time = c[:time]
			    bool = true
			end		
		end
	end
	if !bool
		re=('.*?'+'(main)'+'.*?'+'(left_standing)'+'.*?'+'(def)') #find any left_standing in main before def left_standing
		m=Regexp.new(re,Regexp::IGNORECASE);
		content.each do |c|
			txt = c[:content]
			if !bool and m.match(txt)
			    string = txt
			    time = c[:time]
			    bool = true
			end		
		end
	end
	if !bool
		re=('(def)'+'.*?'+'(def)'+'.*?'+'(main)'+'.*?'+'(left_standing)') #find any left_standing in main that follows def left_standing
		m=Regexp.new(re,Regexp::IGNORECASE);
		content.each do |c|
			txt = c[:content]
			if !bool and m.match(txt)
			    string = txt
			    time = c[:time]
			    bool = true
			end		
		end
	end	
	if !bool
		string = "null"
		time = "null"
	end
	thing3 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
	thing3.save

	# #fourth milestone
	id = "4"
	metric = "left_standing called second time"
	content = Content.all
	bool = false
	if !Content.where(content: /def&nbspleft_standing/).exists?
		re=('.*?'+'(main)'+'.*?'+'(left_standing)'+'.*?'+'(left_standing)')
		m=Regexp.new(re,Regexp::IGNORECASE);
		content.each do |c|
			txt = c[:content]
			if !bool and m.match(txt)
			    string = txt
			    time = c[:time]
			    bool = true
			end		
		end
	end
	if !bool 
		re=('.*?'+'(main)'+'.*?'+'(left_standing)'+'.*?'+'(left_standing)'+'.*?'+'(def)') #re=(re1+re2+re3+re4+re3+re7) from 1st
		m=Regexp.new(re,Regexp::IGNORECASE);
		content.each do |c|
			txt = c[:content]
			if !bool and m.match(txt)
			    string = txt
			    time = c[:time]
			    bool = true
			end		
		end
	end
	if !bool
		re=('(def)'+'.*?'+'(def)'+'.*?'+'(main)'+'.*?'+'(left_standing)'+'.*?'+'(left_standing)') #re=(re7+re1+re7+re1+re2+re3+re4) from 1st
		m=Regexp.new(re,Regexp::IGNORECASE);
		content.each do |c|
			txt = c[:content]
			if !bool and m.match(txt)
			    string = txt
			    time = c[:time]
			    bool = true
			end		
		end
	end	
	if !bool
		string = "null"
		time = "null"
	end
	thing4 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
	thing4.save

	#fifth milestone
	id = "5"
	metric = "input requested from user"
	if Content.where(content: /input/).exists?
		test = Content.where(content: /input/).first
		string = test[:content]
		time = test[:time]
	else
		string = "null"
		time = "null"
	end
	thing5 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
	thing5.save

	#sixth milestone
	id = "6"
	metric = "print result"
	re=('.*?'+'(print)'+'(&nbsp;)'+'(\\()'+'(")'+'(Total)'+'.*?'+'(\\))')
	bool = false
	m=Regexp.new(re,Regexp::IGNORECASE);
	content.each do |c|
		txt = c[:content]
		if !bool and m.match(txt)
		    string = txt
		    time = c[:time]
		    bool = true
		end
	end
	if !bool
		re=('.*?'+'(print)'+'(\\()'+'(")'+'(Total)'+'.*?'+'(\\))')
		m=Regexp.new(re,Regexp::IGNORECASE);
		content.each do |c|
			txt = c[:content]
			if !bool and m.match(txt)
			    string = txt
			    time = c[:time]
			    bool = true
			end
		end
	end
	if !bool
		string = "null"
		time = "null"
	end
	thing6 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
	thing6.save

	#seventh milestone
	id = "7"
	metric = "begin body of left_standing function"
	bool = false
	reLSbeforeMAIN =('.*?'+'(def&nbsp;left_standing)'+'.*?'+'(\\()'+'((?:[a-z][a-z]+))'+'.*?'+'(,)'+'.*?'+'((?:[a-z][a-z]+))'+'.*?'+'(\\))'+'.*?'+'(:)'+'(<br/>)'+'(&nbsp;&nbsp;&nbsp;&nbsp;)'+'((?:[a-z][a-z]+))'+'.*?'+'(<br/>)'+'.*?'+'(def&nbsp;main)')
	reLSbeforeMAIN2 =('.*?'+'(def&nbsp;left_standing)'+'.*?'+'(:)'+'.*?'+'(&nbsp;&nbsp;&nbsp;&nbsp;)'+'.*?'+'((?:[a-z][a-z]+))'+'.*?'+'(main)') #main has no def before it
	reLSafterMAIN =('.*?'+'(def&nbsp;main)'+'.*?'+'(def)'+'.*?'+'(left_standing)'+'.*?'+'(\\()'+'((?:[a-z][a-z]+))'+'.*?'+'(,)'+'.*?'+'((?:[a-z][a-z]+))'+'.*?'+'(\\))'+'.*?'+'(:)'+'.*?'+'(<br/>)'+'(&nbsp;&nbsp;&nbsp;&nbsp;)'+'((?:[a-z][a-z]+))')
	reLSafterMAIN2 =('.*?'+'(main)'+'.*?'+'(def)'+'.*?'+'(left_standing)'+'.*?'+'(\\()'+'((?:[a-z][a-z]+))'+'.*?'+'(,)'+'.*?'+'((?:[a-z][a-z]+))'+'.*?'+'(\\))'+'.*?'+'(:)'+'.*?'+'(<br/>)'+'(&nbsp;&nbsp;&nbsp;&nbsp;)'+'((?:[a-z][a-z]+))') #main has no def before it
	reLSnoMAIN =('.*?'+'(def&nbsp;left_standing)'+'.*?'+'(\\()'+'((?:[a-z][a-z]+))'+'.*?'+'(,)'+'.*?'+'((?:[a-z][a-z]+))'+'.*?'+'(\\))'+'.*?'+'(:)'+'(<br/>)'+'(&nbsp;&nbsp;&nbsp;&nbsp;)'+'((?:[a-z][a-z]+))')
	if Content.where(content: /def&nbsp;left_standing/).exists?
		if Content.where(content: /main/).exists?
			if !bool
				m=Regexp.new(reLSafterMAIN2,Regexp::IGNORECASE);
				content.each do |c|
					txt = c[:content]
					if !bool and m.match(txt)
					    string = txt
					    time = c[:time]
					    bool = true
					end
				end
			end
			if !bool
				m=Regexp.new(reLSbeforeMAIN2,Regexp::IGNORECASE);
				content.each do |c|
					txt = c[:content]
					if !bool and m.match(txt)
					    string = txt
					    time = c[:time]
					    bool = true
					end
				end
			end
			if !bool
				m=Regexp.new(reLSbeforeMAIN,Regexp::IGNORECASE);
				content.each do |c|
					txt = c[:content]
					if !bool and m.match(txt)
					    string = txt
					    time = c[:time]
					    bool = true
					end
				end
			end
			if !bool
				m=Regexp.new(reLSafterMAIN,Regexp::IGNORECASE);
				content.each do |c|
					txt = c[:content]
					if !bool and m.match(txt)
					    string = txt
					    time = c[:time]
					    bool = true
					end
				end
			end	
		end
		if !bool
			m=Regexp.new(reLSnoMAIN,Regexp::IGNORECASE);
			content.each do |c|
				txt = c[:content]
				if !bool and m.match(txt)
				    string = txt
				    time = c[:time]
				    bool = true
				end
			end
		end
	end
	if !bool
		string = "null"
		time = "null"
	end
	thing7 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
	thing7.save

	mymetrics = Metric.all
	total = ""
	mymetrics.each do |c|
		total += "<b> Milestone #{c[:metricid]}:\"#{c[:metricstring]}\"</b> </br> is first present in entry: </br> \"#{c[:codecontent]}\" </br> at time stamp: <b>#{c[:codetime]} </b></br></br>"
	end
	"#{total}"
	end
end 
