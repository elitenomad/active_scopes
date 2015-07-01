module ActiveScopes
  module Scopes
    def active
      where(active: true)
    end
  end
end