module CommentsHelper
    
    def firstName(fullName)
        arr = []
        arr  = fullName.split(" ")
        return arr[0] + arr[1][0..1] + "."
    end
end
