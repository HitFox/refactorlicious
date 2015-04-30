var Oarenstoiearsnteianrt = React.createClass({
  propTypes: {
    status: React.PropTypes.oneOf(['drafted','approved','rejected'])
  },

  render: function() {
    return (
      <div>
        <div>Status: {this.props.status}</div>
      </div>
    );
  }
});
