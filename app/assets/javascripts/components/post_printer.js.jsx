var PostPrinter = React.createClass({
  render: function() {
    post = this.props.post
		current_user = this.props.current_user
    return (
			<div className="well well-sm container-fluid">
				<table className="col-sm-3">
					<table className="media">
						<td width="115" className="media-left">
							<a href={"/users/"+post.user.id}><img src={post.icon_url} /></a>
						</td>
						<td className="media-body">
							<tr><br /></tr>
							<tr><strong><a href={"/users/"+post.user.id}>{post.user.first_name} {post.user.last_name}</a></strong></tr>
							<tr><small><a href={post.user.department ? ("/departments/" + post.user.department.id) : "" }>{post.user.department ? post.user.department.name : ""}</a></small></tr>
						</td>
					</table>
				</table>
				<div className="col-sm-9">
					<br />
					<a href={"/posts/"+post.id} title={post.absolute_time}><sup>{post.local_make_time}</sup></a>
					<br />
					<div className="truncate">
						<Linkify>{post.content}</Linkify>
					</div>
					<br /><br />
					{current_user.id == post.user.id &&
						<a href={"/posts/"+post.id} data-confirm="Are you sure?" data-method="delete" className="btn btn-danger btn-xs">Delete</a>
					}
				</div>
			</div>
    )
  }
});
