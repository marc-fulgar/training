var PostPrinter = React.createClass({

  render: function() {
    post = this.props.post
    return (
			<div className="well well-sm">
				<td width='115'>
				<div><a href={"/users/"+post.user.id}><img src={post.icon_url} /></a></div>
					<div><strong><a href={"/users/"+post.user.id}>{post.user.first_name} {post.user.last_name}</a></strong></div>
					<div><a href={"/departments/"+post.user.department.id}><small>{post.user.department.name}</small></a></div>
				</td>
				<td>
					<table>
						<div>{post.content}</div>
						<br />
						<div><small>{post.local_make_time}</small></div>
					</table>
				</td>
			</div>
    )
  }
});
