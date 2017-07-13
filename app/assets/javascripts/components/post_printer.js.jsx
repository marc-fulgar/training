var PostPrinter = React.createClass({

  render: function() {
    post = this.props.post
    return (
			<div className="well well-sm container-fluid">
				<div className="col-md-3">
					<table>
						<td width="115">
							<a href={"/users/"+post.user.id}><img src={post.icon_url} /></a>
						</td>
						<td>
							<tr><strong><a href={"/users/"+post.user.id}>{post.user.first_name} {post.user.last_name}</a></strong></tr>
							<tr><small><a href={post.user.department ? ("/departments/" + post.user.department.id) : "" }>{post.user.department ? post.user.department.name : ""}</a></small></tr>
						</td>
					</table>
				</div>
				<div className="col-md-9">
					<br />
					<small>{post.local_make_time}</small><br /><br />
					{post.content}
				</div>
			</div>
    )
  }
});
