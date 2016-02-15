require 'sinatra'
require 'sinatra/reloader'
#require 'mongoid'
require './models/Content.rb'
require 'rails/mongoid'


get '/' do
    erb :pag
end

get '/execute' do
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
    metric = "input for game/scrimage"
    content = Content.all
    #REWRITE TO TAKE EACH USER ID AND DO THE MILE
    bool = false
    re=('.*?'+'(input)'+'(.*?)'+'(\\()'+'.*?'+'(Enter&nbsp;g)'+'.*?'+'(Game)'+'.*?'+'(s)'+'.*?'+'(\\))'+'.*?')
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
    thing1 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing1.save

    #second milestone
    id = "2"
    metric = "input for # players"
    content = Content.all
    bool = false
    re=('.*?'+'(input)'+'(.*?)'+'(\\()'+'.*?'+'(How&nbsp;many&nbsp;players)'+'.*?'+'(\\))'+'.*?')
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
    metric = "if statement for game/scrimage"
    content = Content.all
    bool = false
    re=('.*?'+'(if)'+'(.*?)'+'(\\:)'+'.*?')
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
    thing3 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing3.save

    #fourth milestone
    id = "4"
    metric = "loop present"
    content = Content.all
    bool = false
    if Content.where(content: /for/).exists?
        test = Content.where(content: /for/).first
        string = test[:content]
        time = test[:time]
    elsif Content.where(content: /while/).exists?
        test = Content.where(content: /while/).first
        string = test[:content]
        time = test[:time]
    else
        string = "null"
        time = "null"
    end
    thing4 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing4.save

    #fifth milestone
    id = "5"
    metric = "loop nested within if statement"
    content = Content.all
    bool = false
    re=('.*?'+'(if)'+'(.*?)'+'(\\:)'+'.*?'+'(for)'+'(.*?)'+'(\\:)'+'.*?')
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
        re=('.*?'+'(if)'+'(.*?)'+'(\\:)'+'.*?'+'(while)'+'(.*?)'+'(\\:)'+'.*?')
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
    thing5 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing5.save

    #sixth milestone
    id = "6"
    metric = "input for individual players"
    content = Content.all
    bool = false
    re=('.*?'+'(input)'+'(.*?)'+'(\\()'+'.*?'+'(Player)'+'.*?'+'(\\#)'+'.*?'+'(\\:)'+'.*?'+'(\\))'+'.*?')
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
    thing6 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing6.save

    #seventh milestone
    id = "7"
    metric = "else or elif"
    if Content.where(content: /else/).exists?
        test = Content.where(content: /input/).first
        string = test[:content]
        time = test[:time]
    elsif Content.where(content: /elif/).exists?
        test = Content.where(content: /while/).first
        string = test[:content]
        time = test[:time]
    else
        string = "null"
        time = "null"
    end
    thing7 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing7.save

    #eigth milestone
    id = "8"
    metric = "input for our team"
    content = Content.all
    bool = false
    re=('.*?'+'(input)'+'(.*?)'+'(\\()'+'.*?'+'(Our&nbsp;team)'+'.*?'+'(\\))'+'.*?')
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
    thing8 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing8.save

    #ninth milestone
    id = "9"
    metric = "input for our team within else/elif"
    content = Content.all
    bool = false
    re=('.*?'+'(else)'+'.*?'+'(input)'+'(.*?)'+'(\\()'+'.*?'+'(Our&nbsp;team)'+'.*?'+'(\\))'+'.*?')
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
        re=('.*?'+'(elif)'+'.*?'+'(input)'+'(.*?)'+'(\\()'+'.*?'+'(Our&nbsp;team)'+'.*?'+'(\\))'+'.*?')
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
    thing9 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing9.save

    #tenth milestone
    id = "10"
    metric = "input for other team"
    content = Content.all
    bool = false
    re=('.*?'+'(input)'+'(.*?)'+'(\\()'+'.*?'+'(Other&nbsp;team)'+'.*?'+'(\\))'+'.*?')
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
    thing10 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing10.save

    #eleventh milestone
    id = "11"
    metric = "print for our team"
    content = Content.all
    bool = false
    re=('.*?'+'(print)'+'(.*?)'+'(\\()'+'.*?'+'(our&nbsp;team)'+'.*?'+'(\\))'+'.*?')
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
    thing11 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing11.save

    #twelvth milestone
    id = "12"
    metric = "print for other team"
    content = Content.all
    bool = false
    re=('.*?'+'(print)'+'(.*?)'+'(\\()'+'.*?'+'(other&nbsp;team)'+'.*?'+'(\\))'+'.*?')
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
    thing12 = Metric.new(metricid: id, metricstring: metric, codecontent: string, codetime: time)
    thing12.save

    mymetrics = Metric.all
    total = ""
    mymetrics.each do |c|
        total += "<b> Milestone #{c[:metricid]}:\"#{c[:metricstring]}\"</b> </br> is first present in entry: </br> \"#{c[:codecontent]}\" </br> at time stamp: <b>#{c[:codetime]} </b></br></br>"
    end
    "#{total}"
end
