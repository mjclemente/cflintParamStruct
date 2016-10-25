component accessors = "true" {

  property beanFactory;

  public any function init(  ) {
    return this;
  }

  public numeric function save( any thing ) {

    if ( thing.getID() ) { //existing
      var sql = "UPDATE thingTbl
        SET name = :name
        WHERE thingId = :thingId";
    } else { //new
      var sql = "INSERT INTO thingTbl(
        name) VALUES (
        :name)";
    }

    var params = {
      thingId = { value = thing.getID(), cfsqltype = "CF_SQL_INTEGER" },
      name = { value = thing.getName(), cfsqltype = "CF_SQL_VARCHAR" }
    };

    var qry_saveThing = '';
    QueryExecute( sql, params, { result = "qry_saveThing" } );

    return ( thing.getID() ? thing.getId() : qry_saveThing.generatedKey);
  }

}