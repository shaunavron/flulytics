#' NCBI Search
#'
#' This function allows you to input a search term and returns the databases and
#' related id's for the records of the search and any linked records for the
#' search
#'
#' @param search_term The term you would like to do a database search for
#' @param db The database you would like to use for the search
#' @param related Boolean value, deafaults to TRUE, set to false if you do not
#' want to view all the related link ids
#' @return The ids for the linked records from NCBI and ids for the linked
#' records with related information from other databases
#' @export
#' @examples
#' ncbi_search("AH1", "assembly")

library(rentrez)

ncbi_search <- function(search_term, db, related=TRUE){
  if(!(is.character(db))){
    stop("Database must be a string")
  }
  if(!(is.character(search_term))){
    stop("Search term must be a string")
  }
  if(db %in% entrez_dbs()){
    curr_search <- entrez_search(db=db, term=search_term)
    print(curr_search)
    print(curr_search$ids)
    if(length(curr_search) > 0){
      link_search <- entrez_link(dbfrom=db,
                                 id=curr_search$ids[1:length(curr_search$ids)],
                                 db="all")
      print(link_search$links)
    }
    if (related == TRUE){
      for(x in 1:length(link_search$links)){
        print(link_search$links[x])
      }
    }
  }else{
    stop("Database is not available")
  }
}

