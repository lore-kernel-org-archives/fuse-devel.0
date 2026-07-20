Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92063E00A8
	for <fuse-devel@lists.linux.dev>; Mon, 20 Jul 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542076; cv=pass; b=NfF92MugCgp/7QR+icWwZkwnMyBWrOhNmmezjkvMq0DBLroDba+Vm8KioI7OOIZeSnkuLw0C83VB000FWmKcP0yieIFr0c+XHiV6+insM0k3Aqc4dtj3e+qUc//QYOVdWxJzIFj9uIIUK6xpZdD9GWMigBTT2xryZcupePPSRE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542076; c=relaxed/simple;
	bh=0rQxBYeUI9kccjQsg7LlbwcyM5KH4xYI/FlafZxUfTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpi5C455Ur2P/oLnAIouJ2MDcdH7ydurXREjVdhCMcPxjvxKfm2/McAmwinNdUbOL1lALoN7+tdMAEis6zJXU+mhJUT7id1tYp/LE++VTk7BqEwu6WSvgVN2Vr4lOMUSDOs/w1m/XPuXWxLFs5b0Mo1mW5oeeRZvxE8GGZqeME0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wy0K3d4t; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wy0K3d4t"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1614804757so1051783366b.1
        for <fuse-devel@lists.linux.dev>; Mon, 20 Jul 2026 03:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784542061; cv=none;
        d=google.com; s=arc-20260327;
        b=jiCa6FIpVDMI84A/PvpM/c71Coi2wRqJ2PsrrcmCfbYLbGIC47upFynD5Daa6cYJva
         wogaAIogc44LSyeyhSfjQSSVRi/E1l12RiTyq7zbpUDwt7Wipsb3mqaoHuRv5+ItkleF
         b0+8Pksf8on3FY2WPid4V21zi5kaOaAPZu6telOyXfGgooZOErla1UghAAt/HGag0UFN
         uGyoAuaHf/1Lt4IK63kZNmfnGf3xQ2uOM/A5CcmNhBRhDbgRrVI3/X/PAuF4YlE3mvAo
         r1lnEzD+2bbm52fDVjkkxqoC1woV3m5+0mWOHU+EelJ9oAEyBy+2Qqkn4edxvzN66uoc
         p4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MCCq1AIeKXMGUk+k9l/Opmj013LJUPQC31Mm1vW63VU=;
        fh=xjwN6yoMU1YVsdU/az1IStYpKHQKwNMaUJle64CTHkk=;
        b=BW4NtOPUgwR/g80pq1BWkirxi1X76z/4eZO7B6uxWWo/j6Cmjzw81V7vn4hrF/446f
         HIaC6RRyJPoDvfjktS8PwaM3jJtIVJMGLR6s0wZoXgYgPhKj4de15bZKFWfW3UajH16l
         2wI6LW+ymau8JvYUk/Xj5OOlJD7hDWRlPdYcPPlVY9ztMSnLlwzHrWcmo7r2dGidtoty
         OIAfq1STHQmQ2JIEsM8IMoJCUsR84zWYMii8GmajFdMvHDK6IQ0sUhiJDVk3XtlT3Kak
         vjgUyMDdoKDS38KSFSnXTbW6Kpk2pTj9G1A2tL4WYls1eNo7zLEiAFlvBjbw9Zp6kpNm
         TgeA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542061; x=1785146861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MCCq1AIeKXMGUk+k9l/Opmj013LJUPQC31Mm1vW63VU=;
        b=Wy0K3d4t/kP9gfNr0Js9wo8GQdxbtw0m60JPUHcaUQxpZ4I08BgH5W43icAqZ2bjGv
         Jpp8LdtmxeJQGjtGxX4teDm+I0wnJwLNU8Hy0O6A743Zyam5OX8XEDp/SMiG/ludARyy
         diilEcByllG1+bGKBtLk7lizrzGu+O1pwRQwEcPgsiMxjIa9wcxZy+DiclaALWKqcEiG
         dgiBekeKRzLLZTTY6xd5N7DzWACAPYTMjZsVjuzLPbj3RW1XZ5dw/xBXfoWZKV8Pthke
         tahm1d438FvWU66bSheFcVMkOEpncKSIqKVWu6AO14WktorxqglqVAa+Hp1SPfbzhOle
         V+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542061; x=1785146861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCCq1AIeKXMGUk+k9l/Opmj013LJUPQC31Mm1vW63VU=;
        b=Nq5+bbkl/9JXshHNA7D/b62M/UlN6s68S/KN2dOeNyf+z5dEuZ/ILLns8FIjr/oXg3
         hLVJ7W39yEe7X9pCdTI+EIRPCx0PqWz6uEmfp+n9vE5Ie5FIp4YpWth78+9VEqjPjYOB
         8s4RU5P/RBnFVJZPXddpX8uSI7cAg+gX7pM+HKo3IclWYJCTcpCNI8G4RYPxvjCGo5vJ
         9IyCElmxUKrj7+qJmxFUDyaCNckhdYpWMUWNBpFovmX389TtwvvnDFLUYF1eepEEXDWh
         9p+e01ztDHzxJ6G5cjEIrkMh+xVNSXflLRJLpQpQ5ILFIMm7/w9gMlRETPaMunHFg1sG
         iwRg==
X-Forwarded-Encrypted: i=1; AHgh+RoYI3c5N/YCXGJdBZXCtVtuCnv4HwK/X1ZK3t05QcBCt/xpqnpYKF0xKsMX1TUC9FVSw5+1aLmqKmy7@lists.linux.dev
X-Gm-Message-State: AOJu0YwThCYUJRft0OtHUt5P2riylVBvo8WLKkbbTHbCyUNIeHuUAVnp
	BJO8xn/Wr5iOuEeVXErsBvKxJmCaEkJosS/NRLh1gWoEKWyW4BjGfjqYqT37oxQ6DpqylUb8Axz
	1d6XNoMlxYxAlKh3dgjaG/4gfQySw/yA=
X-Gm-Gg: AfdE7cluZHgV8M3Hff0+0v9wbjz+B2uw2hA0geuKe+0HdE87Bl79/FCM4HfMad7ge5z
	hA5HvoA5OjJQgZrUYo/ySf8AgJCg7/MGGPSQEM3ngjV5J9fOAyjKccTD5MmFFWMKNf/gcyeuyTl
	GVw2mSCagFVOdG4lZW4ZJTUaqcTvapZGC8k+ybCtteDkSIEypxFC3tcaxbMuPdzPV6DI8Hq+9Pj
	ycLhXnczNRzfkMPnm3tVSkOqaizW3WmeRV6XaaZdlfTmi6MCoVg2kkEH6gL0KMpnU/0Wn+vNA==
X-Received: by 2002:a05:6938:a087:10b0:c16:7969:12be with SMTP id
 a640c23a62f3a-c16b47c1e4emr338791966b.31.1784542060903; Mon, 20 Jul 2026
 03:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
In-Reply-To: <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 20 Jul 2026 12:07:29 +0200
X-Gm-Features: AUfX_mz15n8tVrhQrtGTVlRLA7H7ya2xjAmCYkRT34S0zyePGJ2_WjcXc9IUx7k
Message-ID: <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 5:44=E2=80=AFAM John Groves <john@jagalactic.com> w=
rote:
>
> From: John Groves <john@groves.net>
>
> This has been quite a gauntlet so far. Some requests were made but eventu=
ally
> ruled out (e.g. using BPF for fault handling).

I'm sorry John, but this patch set is not what I was hoping to see.
I don't know if we are miscommunicating or if it is something else.
I will try to do my best to explain again.

I say miscommunication when looking at your comment in reply to [1]:
"First, a scope check. This patch touches only the daxdev registration -
GET_FMAP, struct fuse_famfs_fmap_header, and the simple/interleave
extent structs in include/uapi/linux/fuse.h are untouched. I'm reading
that as tacit agreement to GET_FMAP and its ABI. Can you confirm? If so
the large piece is settled and this is really just about how a daxdev
gets registered."

This was a wrong assumption on your part, it was NOT confirmed and
I even responded to it with a mini tantrum.

I feel that you may have not gotten Miklos' second patch [2] at all, becaus=
e
you have not responded to it.
Maybe because it was sent only to your work email?

>
> Concrete requests (demands?) from the fuse community included the followi=
ng:
> - Pass daxdevs into the kernel via an ioctl rather than a new fuse
>   message/response

Look at this patch by Miklos:
[1] https://lore.kernel.org/fuse-devel/20260529134302.1989958-1-mszeredi@re=
dhat.com/

Look more closely at the diffstat:
 7 files changed, 123 insertions(+), 294 deletions(-)

It's not about this ioctl, it's about infrastructure reuse.
It's about the fact that there is NOTHING special about dax_devlist;
and no reason not to manage it via backing_files_map.

The reason you stated was that you want userspace to determine the
daxdev_index/backing_id - fine, no problem - this is why I asked that
you pass it the desired backing_id in the ioctl.
In fact I think that all fuse backing_ids would be better assigned by user =
space
so the extension of padding =3D> backing_id is not unique to famfs.

And the best part is that this request requires no changes to your userspac=
e.
You already bite the bullet and maintain the new/old uapi but changing the
kernel implementation does not require this burden from you, so to be hones=
t
I really don't understand why you did not follow Miklos' suggestion.

> - Lose the famfs interleaved extent format. I have complied with this req=
uest.
>   It makes some things worse, but we'll discuss that later.
>

I am really not aware of a request to lose the interleaved extent format.
How can this patch [2] from Miklos which reimplements this format as a gene=
ric
uapi be mistaken for a request to lose this format?

> There has also been a desire from the fuse community for famfs to use an
> experimental implementation of virtual backing-devs from Darrick. I'm lea=
ving
> this out as a potential future optimization - although Darrick has announ=
ced
> that he (and $employer) intend to abandon that work, so it's not clear wh=
ether
> that will become viable.

Forgive me John, but I am having a hard time following the logic of
this statement.
How are Darrick's future plans about fuse iomap even remotely related?

In this patch Miklos has ALREADY IMPLEMENTED
"striped "virtual" backing devices (idea from Darrick)"
[2] https://lore.kernel.org/linux-fsdevel/20260601152327.2069787-1-mszeredi=
@redhat.com/

An idea does not die when employers change priorities.

The diffstat is also impressive:
 6 files changed, 219 insertions(+), 300 deletions(-)

Especially when considering the fact that the insertions are generic code
that could be useful to fuse passthrough regardless of famfs.

Let me recap the former review requests as I understand them:

1. Use ioctl instead of GET_DAXDEV
2. Use backing files infra for daxdev table
3. Use ioctl instead of GET_FMAP
4. Use backing files infra for fmaps

Request #1 was fulfilled in the v11 patch set.
Other requests were not fulfilled and with no explanation why,
not one that I could find anyway.

Perhaps requests 2-4 were lost in the spam folder and/or lost
in translation, so I will repeat my question from review of [1]:

Are there any other *technical* problems that you can point out
with the patches that Miklos posted (including FUSE_DEV_IOC_STRIPE_OPEN)?

Thanks,
Amir.
