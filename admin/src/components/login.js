import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import api from '../utils/api';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    try {
      const response = await api.post('/login', { username, password }); 
      console.log(response.data.data.token)
      if (response.data.data.token) {
        localStorage.setItem('token', response.data.token);
        navigate('/dashboard'); // Chuyển đến trang dashboard
      } else {
        setError('Đăng nhập thất bại. Vui lòng kiểm tra tài khoản và mật khẩu.');
      }
    } catch (err) {
      setError('Lỗi: Không thể kết nối đến máy chủ.', err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="container d-flex align-items-center justify-content-center vh-100">
      <div className="card p-4 shadow" style={{ width: '400px' }}>
        <h3 className="text-center">Đăng nhập</h3>
        {error && <div className="alert alert-danger">{error}</div>}
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <label htmlFor="username" className="form-label">Tài khoản</label>
            <input
              type="username"
              className="form-control"
              id="username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <label htmlFor="password" className="form-label">Mật khẩu</label>
            <input
              type="password"
              className="form-control"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          <div className="d-flex justify-content-between">
            <button type="submit" className="btn btn-primary" disabled={loading}>
              {loading ? 'Đang đăng nhập...' : 'Đăng nhập'}
            </button>
            {/* <button
              type="button"
              className="btn btn-link"
              onClick={() => navigate('/forgot-password')}
            >
              Quên mật khẩu?
            </button> */}
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
