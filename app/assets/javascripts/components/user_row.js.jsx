var UserRow = React.createClass({

  render: function() {
    user = this.props.user
    return (
      <tr>
        <td><a href={"/users/"+user.id}>{user.last_name}</a></td>
        <td>{user.first_name}</td>
				<td>{user.department ? user.department.name : ""}</td>
        <td>{user.position}</td>
        <td>{user.email}</td>
      </tr>
    )
  }
});
