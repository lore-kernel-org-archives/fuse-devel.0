Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE2361670
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 02:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780970905; cv=pass; b=KV8V2VuJT7SOw8Pox3yvcx8H6Ok7+PrNwXR2M79hrK21DVptsOI7M1EzpcJ4T35mkCwYUxm0qI3Kr0t5YUdTET+M71uiUxhHHduTPY4B3VwFzCWk3cji+ThJdKw4+OH7YDBh8XbM/DnIQ1ZVcNEz1F/vQO2nAWP4pCwWCWBtolA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780970905; c=relaxed/simple;
	bh=zChJHPfKcoDCYCfGNqhXLv4T1hOnf5GEBjXnAjpuwic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm1rzPbsLW59uMZF6r5iCVCt1yv4WczgG61JcmjGkoKdKbwkvxkbqCz58w32+gvgHQ9u1E3/8JM4zhp6QhpfX5plTXYz72F3LcYu/uURV6g1s6NE2EVN3CIi0uVT2kgy+M38WAKWu5UH4SBny3FvmN6CN7A2q1Rk3ZtkZ4886rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efkhCBeA; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efkhCBeA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so3666360f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 19:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780970901; cv=none;
        d=google.com; s=arc-20240605;
        b=ENZhR28Z1Lu+JrbSBcYlC9ZZw98HzgvRgBDFxn2I8RQi1ntt305hNo02tsoEDl9/Tj
         9dABRF/lOMy6sBDpgjbPRmgil/Q1HwGlUpP8/6ANgckl08qetNoWNKYYu7zMk/6rL20B
         NSnwVDuqV7pjpqzaSEuuc0WcDRi3Pi40xWeFPMgZIg4aHCUbBhp1GE4GTtFrtRtuRP3L
         Y1w5A9S6VUto4vujYRC/FYYqtOfb5zWT+XIbNsRQVHehdPF9tnM3fc6IVlkxtZjLw8EW
         S52C8jBPnidCarvkuSkJ3n6Sfd9PDXm6GAyZMBiI/GPNITf9RcF6laGO0lCnOq5SjJZH
         zt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=acqtabDsapWSCa6/hE5Knw8wf9si0FGC/izILB5fcFs=;
        fh=LrQ+AOLYDfQxaIFqNryYigNe7UVxTxWqzi6VaEmbSe8=;
        b=Bq3S14BmHjLmZLp/2TfvKceHOKIo3KBcbRKbHELucSBMwYsPZgrT0oM8eH9mFe5M+m
         hhsjRpVadQ0jGUWaDy2E4I5kJBiRduywCSQl/fWDAxSr05qSDwMK/QRCsE7Dj+yz7mE0
         jtO48anctNbRejRv408SCqG4wx93r3rBwcTEcQf1+it5xaBt0KGfoodqKAXutbvCn0pb
         OX03Wu9uOscdBUBMVXwgRzp3o57wjHDuTEMLs7I0DObueaJ599MgRTFSPvQcCk9iewvW
         BufL6AN3BGy6r1lH9wH4faVZn4teeZB6bKJv8I/oxcAPq48mSl4oL26noc+EnmfNfDyC
         yfyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780970901; x=1781575701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acqtabDsapWSCa6/hE5Knw8wf9si0FGC/izILB5fcFs=;
        b=efkhCBeAjjCpT/20Ek92DlXVhQ9quZprPvS7xXB6rIbpbPH/oVZTF2QOq5H5BDXweA
         /ywiuNA3lHhTlmjrOQCh4FYo06klq66ul7ZiTP0h9OG0iw3LP2HG9OFaL5+eF6KYNRkR
         D82r323S+wyE1v6SFAPCGmyhkW2d4ZNcJZs5H7VjnPSYTjRngeexxq4NRbwXRvJjUe3w
         ks7aEnZir9/QkH4lPAKamgQkxfrAi9teusEJeIMRrnNvuu5bLFzrhSsji+RyfdfQbBMX
         /UbOaA00QAWWbHvrbObPbPyEoDNZFGFDvWWKVXVSHzAcKXkF4r577fug0Vu7rsndsjh4
         gB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780970901; x=1781575701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=acqtabDsapWSCa6/hE5Knw8wf9si0FGC/izILB5fcFs=;
        b=G7jaSiVIUokcpxuzKEIcAQnP6RLrIEHE8xmEeZNsLd8nykedPDq79Yb3K34sRXVVDt
         9XCSxCOFRqi8Bc3TsiAKF7atDmoEPbf6/LCQfmrnkLfITRvBvxc18EFPH1oivZ4y/NS8
         cX5gihTG9KVIBkT6adYSYHUmsK/LaiJT8zwdfPxHKV6r+hKSyvmFlYsl+rGAZg/7YRdi
         d0M5c274u7r9gUx+dnmj+IW7/1W3hQCNLXHgAKqlawvZ6FUgl2ruQxQmfk2srbm+upPy
         40SefDWIWF1kY+zwerOsZ/CmTiTi+mQku5S5Ffj72OwKgfU87EuGT2atpLuMHXDrSgPb
         DKig==
X-Forwarded-Encrypted: i=1; AFNElJ8zHjeUsqBlp7k0QtgA6lBqqzLFI777J+sQ887LJ8ETDO9vbVYjlEzulpJCVOg3/7ZQVkTbWigyqbdT@lists.linux.dev
X-Gm-Message-State: AOJu0YwTBPAT9G5+3oz0vzNVKW58lQufFTGF+F79DBm8HWGn8nWDFI/F
	d5fIBlPX4StYF97/pz/qjanp4mfdEUk0o/W1IuJbx738Bmzlk62imqZW3B5n+KYvmC5jnZdmvUM
	fK+QPxijuXLknyAYQzU/cJ8/L4Zl8Cqk=
X-Gm-Gg: Acq92OGdfFley/m+VfmYxgcsieGw+Hm3RaErfxRB3J2/fjYLSuf26IIYeN12EKc80Hi
	Fn4FpnzPGbo/v8NPLS3RBLJcxGBloV0GIhwK0fZzTUUFf5Cl6GiAx5PlCZtYv3b5DJFJzIRqlqh
	b2yolNDmetmTlFaQPXEGXkWPDjeCyUzGSVXfSVV+Oc2zEoYAG7qglyieB7nKJP/aG9drih1igZw
	QsghlbK3pxH8uxYQbrclz2h2ed4QW01QkuSRhWZ6zEvtFf6xorUIUu7Algf4e9nra551BbJ2b31
	3cxpz/brOPV+MC6pgQpsaQFeJ8uckTP/Ss0fsBmDcnrseZbGA58pQuCoqV1ePcSGpCWRryrJsA=
	=
X-Received: by 2002:a5d:40c8:0:b0:45e:eec6:5020 with SMTP id
 ffacd0b85a97d-4603063ff2dmr21380501f8f.38.1780970901310; Mon, 08 Jun 2026
 19:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com> <20260606-fuse-io-uring-race-fixes-v3-3-6fdf5e5b3437@bsbernd.com>
In-Reply-To: <20260606-fuse-io-uring-race-fixes-v3-3-6fdf5e5b3437@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 19:08:09 -0700
X-Gm-Features: AVVi8CeVxKSfucqhkLRZUcVqopUg0fbprgDAwM0wFyhLovYGFr-oIuCQjAeSqrg
Message-ID: <CAJnrk1Zjn5FK8gj=a5gxJbYzQMC0rQ-FPcy1Nj-r9N7ho=PnhA@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 3/4] fuse: {io-uring} Make a fuse_req on SQE
 commit only findable after memcpy
To: bernd@bsbernd.com
Cc: Pavel Begunkov <asml.silence@gmail.com>, Luis Henriques <luis@igalia.com>, fuse-devel@lists.linux.dev, 
	Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	xlabai <xlabai@tencent.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:13=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> Bad userspace might try to trick us and send commit SQEs request
> unique / commit-id of requests that are not even send to
> fuse-server (io_uring_cmd_done() not called) yet.
>
> fuse_uring_commit_fetch() ends the fuse request when the ring entry
> has a wrong state, but that could have caused a use-after-free
> with the memcpy operations in fuse_uring_send_in_task().
> In order to avoid such races the call of fuse_uring_add_to_pq()
> is moved after the copy operations and just before completing
> the io-uring request - malicious userspace cannot find the request
> anymore until all prepration work in fuse-client/kernel is completed.
>
> This also moves fuse_uring_add_to_pq() a bit up in the code to
> avoid a forward declaration. Also not with a preparation commit,
> to make it easier to back port to older kernels.
>
> Reported-by: xlabai <xlabai@tencent.com>
> Reported-by: Berkant Koc <me@berkoc.com>
> Fixes: c090c8abae4b6b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@kernel.org # 6.14
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  fs/fuse/dev_uring.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
