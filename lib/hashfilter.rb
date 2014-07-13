require "hash_filter/version"
require 'active_support/core_ext/hash'
module HashFilter


  def self.keep(hash, filter)
    Hash[hash.map do |k,v|
           if filter[k]
             if filter[k].is_a?(Hash)
               [k,self.keep(v, filter[k])]
             else
               [k, v]
             end
           end
         end.compact]
  end

  def self.drop(hash, filter)
    Hash[hash.map do |k,v|
           if filter[k]
             if filter[k].is_a?(Hash)
               [k,self.drop(v, filter[k])]
             else
               nil
             end
           else
             [k,v]
           end
         end.compact]
  end


end
