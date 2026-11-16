Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825152;
	b=yPkIhKVdooQ+u5HIBc7v35YJtT/kk+NthV8Nhv9PpNdx/a9b1QcO4YRuu6xYBFWbX7i2
	 12RAj277SicuUItJKH25Td+HUwjz76a6G/lbO4cvJUR9+ssqBxaeUZLHJdC9nrX/RlWqh
	 w3bXxXnjosa44nYPcvHXP6N0SdzohC3PtGPlYWMEnyQ1WqewGb6sBjDSgUewL4e/d8MeY
	 ljG62js45nz3SquaijrBsmTGEHEtJS8lVsftPTGUFoPDaABFIPD2gH1mp3yekzJqVu/sj
	 LNghQ53BD6cPCzMQYliK9gQANttcOvWd0RmWed9wZavcxnHDtr8UP2UbA9RKDDY+5YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
	b=Guy/8GTmhmEyb2Ddvwoyf6JhWomD4EZ9+y9eJvKYhl4qATD/OC8rV6ShosMf85bikeXH
	 ky1DhjHq0ejdz3smhvr8GDRoaRNU4SROE7sQZECQ+oU4/A7Mr4htJ39Nne3VBHieCK9lq
	 ZufPGZsIA9k3CF+RnaEkUfqUn012ooDrxpBbMCBYkVnn2WJCW2ZTlQl5Vj/o8OH2Xb/Ql
	 DhYEe7wjX0r0mcGdlt2G0S9NABkxXf77WWCQcnpEQAgOSIDuD8d4noOwBgmJIbPl+m9ld
	 /tQxIyPIa7iwW6spQGgcPpwYcaLeThx/Ma0kk9oONKH5kmAiTFF2wJYreWM7mKOJ24w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EogHAwfH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD1606A32A
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 10:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFD1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EogHAwfH
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5300699a12.2
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 02:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825150; cv=none;
        d=google.com; s=arc-20260327;
        b=RNkoyWVrPnfmd1/XoCxw+q3JvbFEX39440o/kILainjoBsSqA8yjKkTeEyrOJjqm4r
         NftDfrOSiVJ/y7P3VSf1NdxuhY6vGmgUFzasdEZAIiZPa6nix08iOLirtZnwcdxwvK7i
         qcvDeCKdsVUmCCaF9doBe717DhHIwIPJTYg01vg1jmoAnc5CfTtbnMhwYqeithGvXoCg
         JOlZSKsy2rPPTwnwvjwDbgclyk7ZJo+TygWIMvfYs3SS7VCDvLrykExBcK5k+6ySOxvQ
         idg5IPX48qvX77S04xSXAeHswzVJAe6ms8pbj8bq3t7K2MYQY43NAUpZwiTZuajWPAqj
         Qzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
        fh=d8S+d+oGaWTkDirQHtpRYw8WSJoJyuZ/5m9t/7Jqs30=;
        b=L4A39U2vlTW2ZjOlqwRfmZKXP7fp2YPeBBTvpEEvXEuLGhR+NDLq+oUK9E3YjV5+Pj
         /wqBSBK3PYSdFjLpuvKkBOlYB4Z3VLvaLz6IQYM5ZEKhXyBBys4ERNx5YCd2QOm0Qg+q
         /rJDlKf5w7JLZz/C7PWqSMAEaqdKnigm09A1r/PP5549igGdBmVyk6w4WijgjdOmhryv
         AxYpjlmrTzZUHMSK696tMlZuwHc62vnh8giFsv2ftioLy1My9efv26++TIGajINKzwUs
         alkbWOA9kLO+6JGTE9Zv2JqJrO1XxKUbmwjeDfP3sk/EFgO2ynMt8CUvHqYDXsoEm8Ot
         CWeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825150; x=1795429950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
        b=EogHAwfHN4wKV0Qt5TH7o2jRncblHdrpEqpUXiGkvxwQjHCa2w3bRuyIBQ7L6CFw4l
         GGmIEEMQ+34nQNdtMQui/XZTX+TZM4EJKBkNpiL+cMDjWgb2DWqYCvS6AhEtrlIYhBuU
         8wbUTF2IfyOKegb1LSSNX5U9acyPtnGFobRvsgyleCh9BUj9MsjHiAe2MN78tE2CPIzr
         unv5XjlMygECgHqNVfxN8VoeO3WuqmY6OUBa4tAUCmDS+g13jGeYr3BJ5iaX39fVlRGO
         puifJIqvnB6cgvm4N/AqD0XaWQQyRd7nwz6icknH4Shn4xCChbA0YFrWeT8LigGzYtYn
         jD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825150; x=1795429950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
        b=Jf/xnLjYLEciYPofZBXU4aw2z1amAr9qk1Ms0/0+qz008f8zBs0T/Z+owAaBwgEr3B
         o0Dv7chS90w/eZjx7vqqr7cuxmw6Q9gw7LeoUzP0+c5+Tm1gvlakDwHuy3AZTaxey67e
         4usD/xutj2Lfuf7WZ2tajL3xwiwUj8jXY/5KVeqstnMvglsjifrjkrZjfE/icbpq/cl3
         JDEluE7fOjyO0ADmHepKjp4YCLS/R9xsGqjE+moVbljjxZKcrOXs2JZMto5+EVrLrWSE
         PcZy1rYbwRO7B0TOaeBnA07K/3UVKoHM6kuhWwf8KazkLoD5tqiyToMw0n/+qlL3tTmx
         EAqg==
X-Forwarded-Encrypted: i=1; AL+hErGfjo9zPkJYScL+WzJhGtaQfJUrf2NS1OcparpgbqNthbx3t9TWTvPqcNPQagrWTrA/tMtsq1a6wjfc@lists.linux.dev
X-Gm-Message-State: APuU4Z891yX18zKOlAtbbCDNsHJyeSYFvDTkkaWUshibFK8Ss/NnVO9R
	LsNFtl8XEa+0P5mUBaFSNrqjjzeSgrqzBB1Vw8cN6tGB4uyOhT2RjckQMEieslqNzra8y0ZG4yI
	VBeAQ9nuLquIqna0ICFsKhCZrA8Ofqx4=
X-Gm-Gg: AYBFou3wVwA5dTVUuiYAjc22v0AYA2jAiDKc/LT/7mrl+oyZWpEeJ2kABcP5HWScNpN
	sKeFGIeUvo4t+P2vPp3+dxdAQ8r9SaENBqhDE+zFT0cFeM9xF4nMH5nTExKNtXrpqehXhz6t1E9
	cxImMvFg1WxezKTOv7eIIdLiYIoIPmDJWOfgtr1a9JyyjRvgiZherpapUhUD8FLRNZMpBSYaxlz
	4KWjjHUM8KKLGIetmAB4HF1wFsG0CKYvcVj+awC+W6BC0PGCTiKr2dUX1+HO1IiQqYAsJY6u7iX
	PKp6XUz8+AhvzO7j4XSJ77g5WjNH3YQDhoXUc91HYZAHSRKPBrBBYUnun8CddVlNuwuPFTp4UdI
	ynpi9JeoivqHMVfW2KTMovMvFsW9sFqvkGg2WahM7TdaF1uYM4VW6md+cEyMQnQfYMg7poQ==
X-Received: by 2002:a05:6402:a514:10b0:6ac:9a44:d3ed with SMTP id
 4fb4d7f45d1cf-6b7c08954bbmr4966094a12.5.1794825149341; Mon, 16 Nov 2026
 02:32:29 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com> <20261115210952.2140036-3-graypanda.inzag@gmail.com>
In-Reply-To: <20261115210952.2140036-3-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 11:32:17 +0100
X-Gm-Features: AclHuK8XXyhaCAgxTbITMp8zV3Fd6NqncgeiQCT2joxj7Z8uLLH7t09QB68vJSg
Message-ID: <CAOQ4uxhR=ERNBYsxQ06-sKGrTXvePpzv-xi+62oceNff6Mzzbw@mail.gmail.com>
Subject: Re: [PATCH 2/3] inotify: zero-pad event names after an embedded NUL
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:10=E2=80=AFPM Junyoung Jang
<graypanda.inzag@gmail.com> wrote:
>
> inotify_handle_inode_event() allocates the variable-length event with
> kmalloc() without zeroing the name buffer, sets event->name_len to
> name->len, and copies name->name with strscpy().
>
> If a dentry qstr contains an embedded NUL byte (for example, via a
> crafted FUSE READDIRPLUS entry aliasing an open directory), strscpy()
> stops at the first NUL while event->name_len still covers the trailing
> bytes. copy_event_to_user() then copies event->name_len bytes to
> userspace, leaking uninitialized slab memory from the tail of the
> event allocation.
>
> This mismatch dates back to
> commit ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"=
),
> which replaced strlen(file_name->name) with file_name->len, and remained
> in commit b8f2688258f8 ("inotify: Use strscpy() for event->name copies").
>
> Switch to strscpy_pad() so any trailing bytes up to event->name_len + 1
> are zeroed.
>
> Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"=
)
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> ---
>  fs/notify/inotify/inotify_fsnotify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/ino=
tify_fsnotify.c
> index 6e3af6452dcc..78eb1e92a14c 100644
> --- a/fs/notify/inotify/inotify_fsnotify.c
> +++ b/fs/notify/inotify/inotify_fsnotify.c
> @@ -121,7 +121,7 @@ int inotify_handle_inode_event(struct fsnotify_mark *=
inode_mark, u32 mask,
>         event->sync_cookie =3D cookie;
>         event->name_len =3D len;
>         if (len)
> -               strscpy(event->name, name->name, event->name_len + 1);
> +               strscpy_pad(event->name, name->name, event->name_len + 1)=
;
>

I am not sure it is inotify/fanotify responsibility to hide awkward names
which filesystem emits.

First of all, I think the solution should be consistent with d_path(), so m=
emcpy
instead of strcpy here may be enough to avoid leaking uninit memory.

If we want to be nicer to userspace, then we could for example pad the
garbage bytes with "???" for here and for d_path(), but I don't think
this is worth the effort and also don't think that hiding the fs flaky name
with strscpy_pad() is the best way to go.

Thanks,
Amir.
