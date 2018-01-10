class Planets

  attr_accessor :id, :title, :body

  def save
    conn = Planets.open_connection
    if(!self.id)
      sql = "INSERT INTO rock (title , body) VALUES ('#{self.title}' , '#{self.body}')"
    else
      sql = "UPDATE rock SET title='#{self.title}', body='#{self.body}', WHERE id = #{self.id}"
    end
    conn.exec(sql)
  end

  def self.destroy(id)
    conn = self.open_connection
    sql = "DELETE FROM rock WHERE id = #{id}"
    conn.exec(sql)
  end

  def self.open_connection
    conn = PG.connect(dbname: "rock")
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT id,title,body FROM rock ORDER BY id"
    results = conn.exec(sql)
    rock = results.map do |planet|
      self.hydrate(planet)
    end
  end

  def self.find(id)
    conn = self.open_connection
    sql = "SELECT * FROM rock WHERE id =#{id} LIMIT 1"
    rock = conn.exec(sql)
    planet = self.hydrate(rock[0])
    planet
  end

  def self.hydrate(planet_data)
    planet = Planets.new
    planet.id = planet_data['id']
    planet.title = planet_data['title']
    planet.body = planet_data['body']
    planet
  end
end
