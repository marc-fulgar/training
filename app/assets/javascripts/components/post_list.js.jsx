var PostList = React.createClass({	
	render() {
		return(
			<div>
	      {this.props.posts.map(function(post, i){
	        return <PostPrinter key={i} post={post}/>
	      })}
			</div>
		)
	}
})