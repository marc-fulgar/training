var UserRow = React.createClass({

  render: function() {
    user = this.props.user
    return (
      <tr>
        <td><a href={"/users/"+user.id}>{user.last_name}</a></td>
        <td><a href={"/users/"+user.id}>{user.first_name}</a></td>
				<td><a href={"/departments/"+user.department.id}>{user.department.name }</a></td>
        <td>{user.position}</td>
        <td>{user.email}</td>
      </tr>
    )
  }
});
