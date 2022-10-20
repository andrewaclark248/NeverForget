class BlockTorIpAddress
    include Interactor

    def call
        exit_nodes = []
        response = HTTParty.get('https://check.torproject.org/exit-addresses')
        exit_nodes = response.body.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/m)

        if exit_nodes.include?(context.ip_address)
            context.fail!(error: "Logged in Via Tor Network")
        end
    end

    
    def get_exit_node_list
        exit_nodes = []
        response = HTTParty.get('https://check.torproject.org/exit-addresses')
        exit_nodes = response.body.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/m)

        if exit_nodes.include?(context.ip_address)
            context.fail!(error: "Logged in Via Tor Network")
        end

    end

end