class Parser

  #=========================Script A===============================
  def unique_urls_from_file(file)
    array = []
    file.each do |line|
      array << [line.split(' ')[0], 0]
    end
    array.uniq #['/home'] uniq erase all duplicate
  end

  def process_unique_file_url(file_url = nil)
    return [] unless file_url
    unique_urls_array1 = unique_urls_from_file(File.open(file_url))

    unique_urls_array1.each do |unique_url_e|
      File.open(file_url).each do |line| #Orginal or unfiltered file
        #Orginal or unfiltered file
        if line.split(' ')[0] == unique_url_e[0]
          unique_url_e[1] += 1
        end
      end
    end

    puts unique_urls_array1.inspect
    puts unique_urls_array1.first[0]
    unique_urls_array1
  end

  #===========================Script B==============================================
  def unique_visits(file)
    array = []
    file.each do |line|
      array << line.split(' ') #Restructing the content of the file and appending them to array
    end
    array.uniq #Deletes duplicate
  end

  def process_unique_visit(file_url)
    unique_urls_array2 = unique_urls_from_file(File.open(file_url))
    unique_urls_array2.each do |unique_url_e|
      unique_visits(File.open(file_url)).each do |line| #Looping through non-duplicate
        #Looping through non-duplicate
        if line[0] == unique_url_e[0]
          unique_url_e[1] += 1
        end
      end
    end
    puts unique_urls_array2.inspect
    unique_urls_array2
  end


end