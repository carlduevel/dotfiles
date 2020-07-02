{:user 
 {:plugins      [[lein-ns-dep-graph "0.2.0-SNAPSHOT"]
                 [lein-ancient "0.6.15"]]
  :signing      {:gpg-key "2048R/B44D04C7"}
  :dependencies [[hashp "0.2.0"]]
  :injections   [(require 'hashp.core)]}}

