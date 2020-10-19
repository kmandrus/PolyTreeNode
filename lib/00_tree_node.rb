require 'rspec'

class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(node)
        if node == nil
            @parent.children.delete(self)
            @parent = nil
        elsif @parent == nil
            @parent = node
            node.children << self
        else
            @parent.remove_child(self)
            @parent = node
            @parent.children << self
        end
    end

    def add_child(child)
        unless @children.include?(child)
            child.parent = self
        end
    end

    def remove_child(child)
        if !@children.include?(child)
            raise "not a child of the node"
        else
            @children.delete(child)
            child.parent = nil
        end
        
    end

end