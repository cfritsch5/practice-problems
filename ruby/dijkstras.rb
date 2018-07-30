require 'pry'

class Vertex
  attr_accessor :edges, :id

  def initialize(id)
    @id = id
    @edges = []
  end

  def add_edge(id)
    @edges << id unless @edges.include?(id)
  end
end

class Edge
  attr_accessor :src, :dest, :weight, :id
  def initialize( src_id, dest_id, id, weight = 0)
    @src = src_id
    @dest = dest_id
    @id = id
    @weight = weight
  end
end

class Graph
  attr_accessor :vertices, :edges
  def initialize
    @V_ids = 0
    @E_ids = 0
    @vertices = {}
    @edges = {}
  end

  def add_vertex
    @V_ids += 1
    v = Vertex.new(@V_ids)
    @vertices[v.id] = v
    v
  end

  def [](id)
    @vertices[id]
  end

  def add_edge(src,dest,weight = 0)
    @E_ids += 1
    e = Edge.new(src,dest,@E_ids,weight)
    @edges[e.id] = e
    @vertices[src].add_edge(e.id)
    e
  end

  def dijkstras(src_id,dest_id)
    binding.pry
    distances = {}
    visited = [src_id]
    unvisited = []

    @vertices.each do |id,vertex|
      unvisited << id unless id == src_id
      distances[id] = {}
      distances[id][:dist] = Float::INFINITY
      distances[id][:pred] = src_id
    end

    current = @vertices[src_id]

    until current.id == dest_id
      current.edges.each do |edge_id|
        #src = current
        edge = @edges[edge_id]
        edge_dest = @vertices[edge.dest]
        # dest = @vertices[edge.dest]

        if distances[edge_id]
          prev_id = distances[edge_id][:pred]
          new_dist = distances[prev_id][:dist] + edge.weight
        else
          new_dist = edge.weight
        end

        if new_dist < distances[edge.dest][:dist] #new distance less than current distance
          distances[dest.id][:dist] = new_dist
          distances[dest.id][:pred] = current.id
        end

      end #end each edge for current

      # select
      current.edges.min {|a,b| distance[a][:dist] <=> distance[b][:dist]}
      # make current the next closest
    end #end of until destination id is current id
  end #end dijkstras
end #end graph class







#stopppppp
