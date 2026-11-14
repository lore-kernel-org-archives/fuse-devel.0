Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686762;
	b=IIUEFNNIaIP+T3gEAy9WIO8qvA1YsCqISyq8AjUCBE95ZECQfhqdKB1fAODXp+mqSp7f
	 bV27m7ppWk1wux36gLn675ppTSEJGYjIStm1u2BMZZ++mD/oT9nnXIAqWzxSiO5OBf9Vl
	 aSUm+WytjvznVo8HWJDjLT8qXBh3toJF0yydwbypqKxKEQnMWh5FrGbzTMgCpF57mroaX
	 d+uHhhRcwj1CW0W/KUpmZw/eEIJahQIsASId9Dkjz6I21pQzlxxIx7hLEIMHMhvwPX12p
	 Hyj0oR87tRVgiUmr9NhD1FdzYLsPVsjEhWkXsvBotDXxeqJe3I5xBGjtQVqtUt9xBiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
	b=MfzbQWp+ETc9N9O3xZJpgVDXfAtuyrpiab4BJicNkDvspj82WrFf7M/lt/9NkGa2HZDl
	 vXn9uwBotOLaXJf8AU4EzJLLNN3uKvKMkDnIG9eHZF/C2DolX5XpZ3R4W016IUXoDZT0I
	 XODHGsJVZhf+MvXTO124tdZvFoLvnt5OJAC9TJowYXNpnycwDRRgXYfnwHoAkNFXbwXs1
	 h2pjBanlImT3tbTrVvVuBwhifVbfWVcBgBp7Cy/UYPUk2MS90B2KpA/+HQMuhBUCkM0+z
	 4I4iY/18u0tKV+XUYluZ6WD0Hg0sgi2jrHqEaW275jCSOb5K1ZNE9yrFkxMFXlejKxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=v3HMjNq4;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC9E60A380E
	for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC9E60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=v3HMjNq4
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc758830601so2488362a12.2
        for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686761; x=1795291561; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=v3HMjNq41lVlbWtdzT4CFv6Psnqz6lFlawzd7ghXSUumwPeClYtDKOCE3eFYGT711w
         EZj0Mi6AOVw9gsDLJdAA9rn13sFYTyS3MvMJv/SqZgPd005e5C58KKdUcd56yaBOwxkM
         /4qjObAe1Sg78iPdnUBsPKDNFGLU+MaOOo47M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686761; x=1795291561;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=UDAUXlul/k31T77aKrufMVWacPQAEREIG23sQuAGMg1VDwB1ugjVfe8FsKimM/FdrJ
         zMJNXB2L1/z3hiobKgimutofna+maglyXoxwhlp5uf1p917NAZkWx52L/Wh4kaiOBtn2
         au6FZNdBcroamO1E92SQE45GYZ+4xN9dwaynHZ3gY6GxNWyAE3fC9C9ourALmNAnM5X8
         8r3DlG3c+BrLSjqeIOkXuKzRyUU1YQK/2zc9Wg8UcOUzCjg7guJC4sOD76Xx7+RTxW5m
         DYzv9QyGLDVFYWh3C3JVJl213gw0RUQOAEtUEuKu2Aypanklr0qwxaV02eO8kFSx4q3T
         VtHw==
X-Forwarded-Encrypted: i=1; AL+hErHYpRjBzxVDtQZ5ZD01kU2OY3hDyrjxFomA6Cm/jqrjMpLsi+5vxkxyTq1KhO+Yrxjx4kzDVXjqY8hO@lists.linux.dev
X-Gm-Message-State: APuU4Z8gIwDrWwE3FJKoA+WpqaYk4A/We6aMEp+KM6czt1oWQvrHJYCc
	xqPnPFHZf1v8zO2Aey545yM/GzkK9CysIwFoTa2U4sfiT5WEIUBwYeOouq/s6Ye7bMo=
X-Gm-Gg: AYBFou1+FRVW5WReKjtFkH+MIV2rdAB5lQN8CwtfgI8tnEybBz0msd64JnpRvMakr10
	0OExwbLRYcvvhjgyXT/0+9fifukz/2mtPA8F05+0uHiIbCwgyW/zYxBxQrZO9Op7jdkekYv1tR+
	iINaxN/7eqGS4/OqBB+Bd82fTgic+hdTwKyyQ00u3FydHYtGb9QyFFnYpFouOW7dTP1/atgYr/k
	9ogkglcKEf4f3X+UmW5iPspIRpDocjAC4V7bvK2tT+Xr/5myZ8f7LuJJgU79+NGjjxdULKidsMm
	YgrwF8VTuj3sTlcdDUnactASZo78LKKNyAeblZMt0Qc85/4ChHLydICkbFzC80luzqd/iyRbfR7
	qXGZvJE8uo2yYXHJ2GmZ69P1nD18vEpT+LqmkCLhvIVw0tMaM7DGHlO5QUfpbKXNYO+T5vb+spz
	piRCm8vi0uD7vh328HujDq3ryV/Ffrwlr3/NBgQhEc1mnjun6kOTGlvEY1VjrOdybNYMxfTZLlL
	y6/I0OOwQTpDf37CVKuQ5QbxRKNH1wb7QWZyIj3C9NRV/7f+owakmb2RQSvS7NGg652AhV9dyj4
	Ft19KBsmrBOjMdsFjj1rQ+I56od8TD5oYn7hvoBc6R/mXyGK7AFzS1GKRLM3altwCYORim1v5Oh
	llg0DxJBf/ed90srreIoxjkpIYINU4kjucIP1bXJDzmq7sy+dNUe8gKBRzlJvciyjhDdGw4Nih3
	DwVhPHswd4eLrv9PSJfqyHkg4hoXZC8qIqOyjzSvHqdRgn+7G+BpMAwmWE
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr5629200a91.33.1794686761104;
        Sat, 14 Nov 2026 12:06:01 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm5258887a91.0.2026.11.14.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:06:00 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>+	/* Look through stacking filesystems at the inode with the data. */
>+	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
>+		return -EINVAL;

This looks good in general, but what the bots said about O_PATH files
here is real. With FMODE_PATH this is reached for a file that was never
opened, so on overlayfs nothing has been through ovl_open() to look up
the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
itself, and when that fails it hits the WARN(1) at its end and returns
the overlayfs dentry, so the check passes as well.

Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
it's easy to trigger with that. From a quick test with a metacopy file
whose redirect into a data-only layer points at nothing, registering an
O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives

     ovl_d_real(/f, 0): real dentry not found
     WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
     [...]
      file_check_backing+0x308/0x5e0
      fuse_backing_new+0x219/0x4a0
      fuse_backing_open+0xe8/0x390
      fuse_dev_ioctl+0x53a/0x7d0

and the ioctl still succeeds. A normal open of that file fails with
ENOENT, so nothing could have used it as a backing file anyway, but with
panic_on_warn this is now a panic.

Maybe ovl_d_real() should just stop warning when the lookup fails, now
that it has a caller that isn't trace_uprobe? The check would still pass
for an O_PATH file whose lowerdata couldn't be looked up at that point,
though.

Thanks!

Chris
