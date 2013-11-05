# Redmine Redcarpet Formatter
# Copyright (C) 2012 Takashi Okamoto
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine'
require 'redmine/wiki_formatting/markdown/formatter'
require 'redmine/wiki_formatting/markdown/helper'
require 'redmine/syntax_highlighting/pygments'
require 'redcarpet_formatter/pygments_stylesheet_hook'

Rails.configuration.to_prepare do
  require_dependency 'application_helper'
  ApplicationHelper.send(:include, RedcarpetFormatter::PygmentsApplicationHelperPatch)
end

Redmine::Plugin.register :redmine_redcarpet_formatter do
  name 'Redcarpet Markdown Wiki formatter'
  author 'Mikoto Misaka'
  description 'Markdown wiki formatting by Redcarpet for Redmine'
  version '2.1'
  requires_redmine :version_or_higher => '2.0.0'

  wiki_format_provider 'markdown', Redmine::WikiFormatting::Markdown::Formatter, Redmine::WikiFormatting::Markdown::Helper

  settings :default => {
    'enable_hardwrap' => '1',
    'enable_no_intra_emphasis' => '1',
  }, :partial => 'settings/redmine_redcarpet_formatter_settings'
end
