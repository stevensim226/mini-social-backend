class JsonResponse
    def self.build_response(object, status)
        return {
            success: status,
            content: object
        }
    end
end