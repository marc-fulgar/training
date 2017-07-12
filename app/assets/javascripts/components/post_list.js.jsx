var PostList = React.createClass({	
	render() {
		return(
			<div>
				<table>
					<tbody>
			      {this.props.posts.map(function(post, i){
			        return <PostPrinter key={i} user={post}/>
			      })}
					</tbody>
				</table>
			</div>
		)
	}
})