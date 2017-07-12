var PostPrinter = React.createClass({

  render: function() {
    post = this.props.post
    return (
      <tr>
				<td>{post.id}</td>
      </tr>
    )
  }
});
