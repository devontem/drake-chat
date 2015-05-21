module CommentsHelper
    
    def firstName(fullName)
        arr = []
        arr  = fullName.split(" ")
        return arr[1]
    end
end
