var PostList = React.createClass({	
	render() {
		return(
			<table>
	      {this.props.posts.map(function(post, i){
	        return <PostPrinter key={i} post={post}/>
	      })}
			</table>
		)
	}
})