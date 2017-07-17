var PostList = React.createClass({	
	componentDidMount: function(){
		initializeShowMore()
	},
	render() {
		current_user = this.props.current_user
		return(
			<div>
	      {this.props.posts.map(function(post, i){
	        return <PostPrinter key={i} post={post} current_user = {current_user}/>
	      })}
			</div>
		)
	}
})