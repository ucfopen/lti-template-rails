class XmlController < ApplicationController
    def index
        render template: "xml/index.xml.erb"
    end
end
