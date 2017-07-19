var UserList = React.createClass({
  render: function() {
		a = this.props.a;
		b = this.props.b;
		c = this.props.c;
		d = this.props.d;
		e = this.props.e;
    return (
      <div className="table-responsive">
        <table data-toggle="table" className="table table-striped">
          <thead>
            <tr>
              <th><a href={a}>Last name</a></th>
              <th><a href={b}>First name</a></th>
							<th><a href={c}>Department</a></th>
              <th><a href={d}>Position</a></th>
              <th><a href={e}>Email</a></th>
            </tr>
          </thead>
          <tbody>
            {this.props.users.map(function(user, i){
              return <UserRow key={i} user={user}/>
            })}
          </tbody>
        </table>
      </div>
    );
  }
});
