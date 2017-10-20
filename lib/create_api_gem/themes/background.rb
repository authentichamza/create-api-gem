# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

class Background
  attr_accessor :href, :brightness, :layout

  def initialize(href: nil, brightness: nil, layout: nil)
    @href = href
    @brightness = brightness
    @layout = layout
  end

  def payload
    payload = {
      href: href
    }
    payload[:brightness] = brightness unless brightness.nil?
    payload[:layout] = layout unless layout.nil?
    payload
  end

  def self.from_response(payload)
    new(
      href: payload[:href],
      layout: payload[:layout],
      brightness: payload[:brightness]
    )
  end

  def self.default
    Background.new(
      brightness: 0,
      layout: 'repeat'
    )
  end

  def self.full_example
    Background.new(
      href: "#{APIConfig.image_api_request_url}/images/default",
      brightness: 0.5,
      layout: 'no-repeat'
    )
  end

  def same?(actual)
    (layout.nil? ? Background.default.layout : layout) == actual.layout &&
      (brightness.nil? ? Background.default.brightness : brightness) == actual.brightness
  end
end
