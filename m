Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415458;
	b=12sUxrTBriVCMPN1HwLo/fh69ifsdcwzdh43F1if6el5MYkHB/WogEohZi9QgAuIYb0f
	 WxKZ0Y4s8//dAtlieRVwEFBi4cCxOf3YE/zzlsC5ciDmwQ5hK3lgQb72hxTPFxxKZrUS5
	 Qnw7ZsXirWwgUJwvPlvn+PSoh/x83bxLf80R8jlcRxkGuC6LemC7wTxAdmvr4QEdiQQBT
	 SvWB4SFGLUv03kFZvtElhGIezuAyKMzbAUHWBV0G307gmGk9o5Ro4gdZa1S0ehLBE5YEQ
	 XDXqazYM7Q5WbXdjASx0X+54FjodwB6t7bh99w3s0DoTDKs+Xm+eytjcHEH3gQvVfvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eZsD1auAFGH9focpKeQLt7lmstuziSR0maGDEOD7IaE=;
	b=CA65wqBmW9PtWtLVI7fbepTO8A+6g1E/ODQ3mPXSCBUZqw3hr3TrSlDlyURyxbCGt3kx
	 edmNKYVgsqToiO6y69mm7TrT0toHbyoarHmqW870ndR6ByQks53fL4BySB3zFaYZRcyh7
	 9peqphz5rTWkb6NYBhZmBZVibI1HoSB2zGHfYsCFgH+k7j4IKWTU4rzWh/vZbGdIEk/Bp
	 hf5tBD6faE+hx9jKqh11CNfjbMWO2lRLNsgy+5BXwNQna4O5rW39lFqeX0uWg64xI+zgF
	 t6qhAPdw078jIYMYebQ5PrbLb28Y/0NtY7mdaExPBtsxXG+yqdpHGV4KMdD2SSFpoKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EoQrt1U9;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F870606A33E
	for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 16:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F870606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EoQrt1U9
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so103035ad.1
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 08:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794415458; x=1795020258; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZsD1auAFGH9focpKeQLt7lmstuziSR0maGDEOD7IaE=;
        b=EoQrt1U9IhogOeHX0e5XLNVMl3APIG4E+CpygcfSy1L1+zdMOV84eFLIO4DkaVfB1x
         vchomlHm1RekxDsw9Hk4mqfJ8pJ+Sj5+LFkxt4vnyhEIman8nk37AjUb9s8kIwWZibkE
         ay8hW/ujhnxX6fFemsvXBtGlXgA9riuqVqXXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415458; x=1795020258;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eZsD1auAFGH9focpKeQLt7lmstuziSR0maGDEOD7IaE=;
        b=XRB/w6pKAvuiPDGGB0tEc6Ojk1a6kW8GyyL765JyF1fnbxNKhw/P+s8E/H7T5NeQSe
         vVSHLb02xr8FE157LFqXSkNEGl1ww5z8CFo+9+zMGg5sjUASoYQldL7CWSyLF46+Dlkf
         egYGaLVYAG3yjJjagqQnXf784txlSG/ir5JlhqNWBw+i2hrGl/+gKjdJG975/4PJZdxS
         RW8ayczdOCLWFPAWVfJsKZUXwdMJMZy0GkZWeijEreku761yFE3eyzfdkosB/mHpmpw1
         eh5rdzQhOz/R5sSE8eQl278cjHKU9HdWtao/x56x+6rY5dhLbJLaKpBVlrym5SbUb5EM
         np4A==
X-Forwarded-Encrypted: i=1; AL+hErF6A3rph+EPtSZXdzHqIcNWtxi4bmxPznELIkNubQXSzsymssO8VacuxE4AV4hK6JjxlAZOqWHF3Gtu@lists.linux.dev
X-Gm-Message-State: APuU4Z+1egvGYbDOvlcdZueJODMGZkiFKWRXfsH/Nyp4P5IgQBAG6QPi
	0XFPYaY2qHp2J+7grt0rQFzcIXCkPoAzfP3HtkRfl4YHNEsxrF9dlI+HFi7127Giepm2Y10DPXv
	B8voADU4w6Q==
X-Gm-Gg: AYBFou2YRkqf+N0I6/u/ZjRmN1wKflPTUiiMTXc2VMfDOIaPQ++DAVzoN++oBGbMhDR
	QGDqxJamLUEBTdqD31Co2UridJiRLPUy/lh5ON2Qs2pGIxYQSyWlZY+rKtw3oj3Oi2R7dCkI+EQ
	PiuAKIObdrUnDvVVQ6U/spoDNEyHbTsPDcu88/ozxAD/ilJOxvr/vnES3a0GSjIZLyv4KuNlVdh
	4VMbah6jzWKy4x3+I8OtGy6HaAr3pBh5oT1TM5xyE38gL+1H49dCLdbYpJphvx1LQGcZOhzS3lL
	n+Zf9snUHwO0k6y7sMcdegQ51WCZ73CBmuuOB2oaEn+g4xjirBftL6Uq/0NCm24uehNYKAY3FtL
	ALIOWgw9EN43xzphfGTqanwfYegkrJqDt1e/NQov4NET33xihF2WcXdsiuaWuP6xX8iWL/tp0zw
	vHdM9/UY7Nj+OfDCcrMDoeDDdBnjvh3qlnhKSUbfxU4/kV3Lf+XGXUI/o1oBPzJ85IGanrEl8cD
	oiuNVym7v0IZsX3ge1g773ox+a0GH9wpxtCeP713wZJiVv5ulhl9xfpuEYhz2UNt5U8FUYcgBWO
	TB5g7Ape2e6gMgBAZuRj8gJzklmf1i1vERHs4brarqoQUdGrz9yWz2dSQv8w8U0jOJhyXFiXc0o
	T2Zs=
X-Received: by 2002:a17:902:f68f:b0:2ea:10e9:7db6 with SMTP id d9443c01a7336-2edf16309dfmr283085ad.3.1794415457883;
        Wed, 11 Nov 2026 08:44:17 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4bf02sm23070835ad.25.2026.11.11.08.44.16
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:44:16 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso16063a91.0
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 08:44:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEr3dhT4rF4CD5IDqOkxZYk01Ha1WJoGjrdjXFy1KohjmijgP6Q6og02REqGe26uDPs0MQXzC0DgZPb@lists.linux.dev
X-Received: by 2002:a17:90b:1d45:b0:3a0:cca0:4a8c with SMTP id
 98e67ed59e1d1-3b197c817dbmr35589a91.7.1794415456305; Wed, 11 Nov 2026
 08:44:16 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-2-kas@kernel.org>
 <avNuQqLf9CG9dSsE@casper.infradead.org> <20261111-heimreisen-ungeziefer-empfunden-a892571f2c07@brauner>
 <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner>
In-Reply-To: <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Nov 2026 08:43:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
X-Gm-Features: AclHuK9b6hltBFcCGqxpbtG8UmrJwldogvwXrVDW7-YQ5_XK3IWVlpv59flts7k
Message-ID: <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio_console: copy pipe buffers in splice_write()
To: Christian Brauner <brauner@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, 
	Jan Kara <jack@suse.cz>, "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 05:42, Christian Brauner <brauner@kernel.org> wrote:
>
> So the fix below is what we've done before for pipes and I think it's
> the right thing to do here too. I put the following on vfs.fixes:

Please no.

> -       src = kmap_local_page(buf->page);
> -       memcpy(page_address(page) + offset, src + buf->offset, len);
> -       kunmap_local(src);

This boils down to one memcpy.

HIGHMEM is dead. Nobody sane uses it. It *will* go away. It's already
effectively never ever used.

There are some broken 32-bit arm setups that use it, and legacy museum
32-bit x86.

Don't make one memcpy() that can be inlined become this garbage:

> +       /* The buffer can span several pages of a compound page. */
> +       kv.iov_base = page_address(page) + offset;
> +       kv.iov_len = len;
> +       iov_iter_kvec(&to, ITER_DEST, &kv, 1, len);
> +       if (copy_page_to_iter(buf->page, buf->offset, len, &to) != len) {
> +               __free_page(page);
> +               return -EFAULT;
> +       }

just because of broken shit that nobody has ever complained about or ever hit.

              Linus
