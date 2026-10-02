Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079F2F7EFC
	for <fuse-devel@lists.linux.dev>; Fri,  2 Oct 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790920895; cv=none; b=KvELkhm/f6jD9qt4gp0l/r+tvUr1q1g56ra7QmkLMe0Bm/sUCa17H7hRitimp5TryRerbqBZmgrK5+NFX2iqyfTNPr9c9C2C528377IaRh4haPITpVoiFUbE61O+bazfTFSvxgfewZl8MYDbSO486nU3oDDNSOb4PTBWoZj04xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790920895; c=relaxed/simple;
	bh=Zzl8GQMYT4ovWCoYqlximp5PJDij3vOuu7nwytPtyeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHcCamHt3dToEVVG7XMWMEA+7PwRVvJ68VBO/BE10Y0/iCx7XiYtsiB7fOudue2eGsnawargMMT7enTuzBzad+AT3vXOT1LQDGz7hvhaJeBfTqLyxK0G5jhb6LUJbNukwuXdr0MARvS01SMvsc9sHops01dEiyFOnBQPVtaLebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5uVEKWx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5uVEKWx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db710396ffso4959465ad.1
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790920893; x=1791525693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzqwuTjdPy91zWm37KIYjrvoEq9pY5JTP911vnp5Bg=;
        b=j5uVEKWxHclHRFLlaA9mkgGm4gnXhxOn1ki8h0iVCF3B19JcsURb2A5qNgjPpH+DLq
         swz99ITLvMAma9PEX5q0BrItGplk1i8HMi9QR5paiVxoshGUQ1e3TvuC/27xIXn6iHsW
         gHGlzh5/OejvczGyttQ9B7P1J80u3tj0MBQXMkuyjwhfmfzeXYgm3p6eF42/iJu1XIuN
         A2WhLGiFjd1RK/cvL/coQQD2NGj2j079D6HATxRDF4eRoEyyG6M5EspD0It0D1s+egeE
         k9DXg4jk3nPgmGInjhqc/gWp67GoqDE4cEKFaED+RRTNNnOAY7M03jxje/yaVa4ofLlz
         0F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790920893; x=1791525693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzqwuTjdPy91zWm37KIYjrvoEq9pY5JTP911vnp5Bg=;
        b=nEX+r8ZyvyJU+kdnAUNzDgCjXVBUwtBZVVuEHHmOF8fz6k1VoNKwvqeXGMwdGweA0g
         mk+zRBUCiwvc2+jjWrpWd27Bjqa51aZKy2X+Hf41p2/29Bo5auXIhljzJXFqLfjYg7Y+
         BlbcYT/Vrt60vEwiq/lhSc1g+czIfsD96lSXKXoeFzCzpYNApS2kVXJK+v0lcY0iTekp
         m7aN8tkvmvzkG26PzwHjbEOGWu6dtD/dSNhz39f2m/N0Uo+Oo1ERbdJsxS0Da2dl4h7h
         ccm7r8JbZGXZ/hv8xuYhRUUfPw6g+cvF2HJJUcIfrm/2uLB2w+WkqMI3f6oPC8ab7qlv
         dDgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9GPJ9zf9fW82mLD6jtiwdtE1iHoI8EyRnqXW8Koz27q0EecZR4UqjGkYNe5UFyhRWB63bPWin6CpT@lists.linux.dev
X-Gm-Message-State: AFq9FYI/2e86CPHXsxI8AKL+8mqNcu2L5g3PehsgO8Bg2QsZK0gcCVPN
	uVppj/iDt/OFcu81NUxdC+pL1N9D76cdlqWyHWGkaSLzaDBJahKzy7MZ
X-Gm-Gg: AYBFou2eK0RL9MDGvxOdwD8+CNm9kx6p7vKWt6nyABq0yBNOzJcPivPpFlaMQrjMr10
	8ZuVMpeJtByVRz06JzYqVmTh496zyjd87tlv3ay8ZXom0LnZgNzz75L6LpVN/LkCpUpEx1nZgBi
	RPMJH8SxFMkGh94PMgb7OvUptEanzWhgcHxaAy2dZtG4294w5mDe2Q/deaoT+v4wv0GcdPZG1jp
	BJWIDqKiYseT9b1/aumcas1FJ9uT3LhC/RIo5MwNvx8S4AmDHYACgIVgPU6jGtgmVyNsEG9Zg4p
	bIeeT0ENh001gD/v7WU0PEQevmAzgffUWMDgY3ib3k1kytikgKX3bWSkKdJ+L2ZTmVgc1tYhE6e
	5TCf7nuvjXHMk0u24wE3gDz/RjgNxDd7PwSxUwkElB8knmwSt8+SSTaPuUktbCwrQekgnQzY14/
	rco0jTRnhrKai20Qu38b0pgPo6yF+NUL47YKkTNMyjKSPyj/iaDJS+HLRQ4Lob
X-Received: by 2002:a17:90b:2644:b0:3a0:f2e1:8af9 with SMTP id 98e67ed59e1d1-3a4f3d124f2mr3588321a91.52.1790920893294;
        Thu, 01 Oct 2026 23:01:33 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f721a6afsm519169a12.0.2026.10.01.23.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:01:32 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:01:30 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: NeilBrown <neil@brown.name>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jan Harkes <jaharkes@cs.cmu.edu>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Carlos Maiolino <cem@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
	linux-um@lists.infradead.org, codalist@coda.cs.cmu.edu,
	coda@cs.cmu.edu, linux-mm@kvack.org, ntfs@lists.linux.dev,
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH 1/7] VFS/xfs/ntfs: drop parent lock across
 d_alloc_parallel() in d_add_ci()
Message-ID: <ar9IuknaJqrGoF-j@hyunchul-PC02>
References: <20260929034158.1455429-1-neilb@ownmail.net>
 <20260929034158.1455429-2-neilb@ownmail.net>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929034158.1455429-2-neilb@ownmail.net>

On Tue, Sep 29, 2026 at 01:36:01PM +1000, NeilBrown wrote:
> From: NeilBrown <neil@brown.name>
> 
> A proposed change will invert the lock ordering between
> d_alloc_parallel() and inode_lock() on the parent.
> When that happens it will not be safe to call d_alloc_parallel() while
> holding the parent lock - even shared.
> 
> We don't need to keep the parent lock held when d_add_ci() is run - the
> VFS doesn't need it as dentry is exclusively held due to
> DCACHE_PAR_LOOKUP and the filesystem has finished its work.
> 
> So drop and reclaim the lock (shared or exclusive as determined by
> LOOKUP_SHARED) to avoid future deadlock.
> 
> Signed-off-by: NeilBrown <neil@brown.name>

For the NTFS part,

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
