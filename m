Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030C38B7A1
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285155; cv=none; b=lkmcrw+1oBGcLvjjw5+/r/VBqFyY8WiJAo8biRt4AuLZv0x/SA/nS57zskNNVxjlr92tcL0kKqTX3tiRok4H/skdmbYsrBLsw/LWzmEJVivGz+bR8sz4j48hH+paGYfHgwOXo3MwJkGRXoVcSnEoOqkwEiTY9vmdufPvfxPIJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285155; c=relaxed/simple;
	bh=T+oTEsZifQSSjkTTm8dieBj546vS01rprc6FRMPpgRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJVUivRpwRsWu26/acuKmu/6teS9LnchXO8OFL9ZWa/28ogirTVpl0aMs4fNu+xOxUhinAGzgZnL+WJirrAjGJ0g+ALDJlLXDwFrx93OtffNVoq8UJ0dzl2OBVq+/bjCjFZn6fSH3aTZ5WpHfa678SpX+PQqWtkCWP403urkdTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP80X4C2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP80X4C2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso301409f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782285153; x=1782889953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhG9FcF945Re4Q58PUpr7BwlsxWpmlT6fgah9/vT28s=;
        b=VP80X4C2LEMovPnEmn2cJDyB3XpcTQeZxn+hqir0d5ayChT7Jta/2b9N8MpjcfQr1q
         kqjp+ajjACnCkjpR47VMpGmp/Q3QqJvyQyu3B2u4VxDnXc+zNnnAelQYsixH+y9bfZZy
         l73qFgpyH+EyHTzEIArFF0xFodbR4E6jnThWgn2X2WPfRYG9c3KUOBI3uHaF9aeVUIY4
         RIGvPrl5ZmmdxHToHAgeIuSAepQ+7e0Wm3tCe7aaWzf96xcuyL46UmDAP4+h0bFQlhFK
         ctsKM/Mu7VrPHLpFVOE/kEMwCGYHnZ6idfmHwzX0oZsJgK2euglPFB4+K8AvaGhhlg5+
         Ft6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782285153; x=1782889953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhG9FcF945Re4Q58PUpr7BwlsxWpmlT6fgah9/vT28s=;
        b=HyQG9xVxJ1LTcBgY/Tzx7l6OwYOqfNkMqMJYZEpo1I3rhOTS9yWEhqykClYGRpCCU/
         nz4AzClxbjBQLOIQQJqwzBckl/KIy4IdefRyO8B7faeGVmHQCcJFQYLzpzmj0ws2L8KN
         yNkhMc+ST1wxcy8qPkd012OPyYXFpBXz8x2T7P9NLyaHjijr3HyTJ88erG8d8bJU168d
         9nlgkXQqz/CoIneXFhek7l/wiyCc/nfEuwwkPQaiogMQM3+RaAnWz8jX26A5LIHtF6br
         jDlP+dML9y7xzMUiketdmOfoZ1rixbDOvX1zf8ZrChkJaGmW+CSN2vLKT7PBt53/Dpy6
         bBRg==
X-Forwarded-Encrypted: i=1; AHgh+RrZKkneFbYDoyEb5CWDuvBYQ2jmnbefaXqn4rix6l+/yemG3xj88yTb0gRywoL1fSVQljqUBVVNSq7R@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/1wIDWQPOetrq5FVvdl1eEh6pqhxwgyxVqbTDNOugwCjZYR9f
	pdi+hWO1jA6b5ams8dXFqCOwiAjA63QdiMR4kwtrIOliaiJ1TMMeIgc6
X-Gm-Gg: AfdE7clpZwGuDP0ssOhti2Kd0cWOkEfdn5lwT3t1f6vpYiqsv6hQpdnucWGGgVlnmMs
	fSEtZUaY3WXlMDHZbZid1k6XTe2F28J96MMq3foAM9x/w6Wba9a5s3bjzPRlFnKOeFn6VvXWSRb
	sbzLYe2k4KNgvRtkZGDkXX3e7bCsC9tXjIiOfbnBvvkHcpf6PAyKegqshIrLwzDy/jTBjFGmwEI
	5gpQDuio/Ca9yFSsexEG0VT05MmVMJX+DooJAJ27gr7qWxAY2s7ZitA0nSM1jhzEwmSAlyBV2WG
	y4icXmZ6ElPeDfMrFKJzOi5KuPdWBUGinNRZnnm7ikaOylTxi6/RYc16j9U6EqMkQZSfF/tL7D3
	HXolFNMIqOij7VLes3LcCgJTu0n7+KngdHopgsvRutJnNSc6fdl6YGz28ZVDN3ynz7/b1ZMdWTO
	XtHXbzRA/P
X-Received: by 2002:a05:6000:4683:b0:46a:1f35:113f with SMTP id ffacd0b85a97d-46a1f35172dmr8359155f8f.21.1782285152523;
        Wed, 24 Jun 2026 00:12:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46c1ee0189esm4296531f8f.9.2026.06.24.00.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:12:32 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: avagin@gmail.com
Cc: akpm@linux-foundation.org,
	alexander@mihalicyn.com,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	brauner@kernel.org,
	criu@lists.linux.dev,
	david@kernel.org,
	dhowells@redhat.com,
	fuse-devel@lists.linux.dev,
	hch@infradead.org,
	jack@suse.cz,
	joannelkoong@gmail.com,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	miklos@szeredi.hu,
	netdev@vger.kernel.org,
	patches@lists.linux.dev,
	pfalcato@suse.de,
	rostedt@goodmis.org,
	safinaskar@gmail.com,
	torvalds@linux-foundation.org,
	val@packett.cool,
	viro@zeniv.linux.org.uk,
	willy@infradead.org
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
Date: Wed, 24 Jun 2026 10:12:26 +0300
Message-ID: <20260624071226.2272209-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CANaxB-zK5q=Xw6UZTmeFtXsDZjUsPkFk=p485m-wtNTBnf4hgg@mail.gmail.com>
References: <CANaxB-zK5q=Xw6UZTmeFtXsDZjUsPkFk=p485m-wtNTBnf4hgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andrei Vagin <avagin@gmail.com>:
> The CRIU fifo test fails with this change. The problem is that vmsplice
> with SPLICE_F_NONBLOCK to a fifo file descriptor fails with -EOPNOTSUPP.
> 
> It seems we need a fix like this one:
> 
> diff --git a/fs/pipe.c b/fs/pipe.c
> index 429b0714ec57..6fc49e933727 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -1253,6 +1253,7 @@ static int fifo_open(struct inode *inode, struct
> file *filp)
> 
>         /* We can only do regular read/write on fifos */
>         stream_open(inode, filp);
> +       filp->f_mode |= FMODE_NOWAIT;
> 
>         switch (filp->f_mode & (FMODE_READ | FMODE_WRITE)) {
>         case FMODE_READ:

Does CRIU actually rely on ability to do SPLICE_F_NONBLOCK vmsplice into
named fifos? Or this is merely a test?

If this is just a test, I think we need not to preserve this behavior.

I did debian code search with regex "vmsplice.*SPLICE_F_NONBLOCK" and I
found very few packages. And it seems all them use pipes, not named fifos.

(On speed: I still think that my vmsplice patches are good thing,
despite performance regressions in CRIU.)

-- 
Askar Safin
