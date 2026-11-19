Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129682;
	b=DvDRe/FNB/o32M5f56q8+0pT2t64jucu0pvfkofms0i4EYAKjBbEdupK3ZsE7F0kJcV2
	 0iNQtNoOzxYQAKk4WCdI//OSb68U7KjRv6wvYTJuQvk7vp0bEDqOJZmfxDJVnSQN34WJb
	 QxJbUWAAKTfo1n06FYOINdUvUTX4qPyMpKfQGeRLM1Tdet7TkXomniFwt74g+GI6Jt70e
	 Qv/Hi3UAZnth9x3RzDgTxxIh31mUytoxacyL0i04+HJuIK1oSEu+xM6yKcNyJen6/VJ0A
	 OdMcjWSZujQ1Oc2IPIFhmAVlHf2FnKhYDxSleUskBTPNy6sURqB23v2Zq6ZDUB/iSTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129682;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ac2bxO4Xse6K+kejCnJOueIlO7M24eds47j2TEmWTxE=;
	b=uSemNTYSyAfSdz1stuUgBlsCITj0kjQFkNkHrCdMHu+e5qQJ277kr/vz5WnovNQwxi/B
	 RByHjPamNej1I8RyrWzzV+v0shonBQ1s8Xsb0nA7/qgYSMY0lWDv3GaKQ5QFoj7SDr2Hw
	 xyszGixyvNDkjGB3qwfP+7HIhJvqBwihD0cwH40tneS8shbP/BESVQRa+0ACYhv6Q6nBa
	 Lljv5Soj1L3ZNTU44jUDphYBUsEgubIyNzpD005WTgJYUwIZjyUgcmqpthunKNxzn7dNJ
	 ULvMm7s2khJ5l05yRYbjnCq/A/KVMuW6OMr+pGIVzLWHNM5yz+p2DRzBWNzIfxG9XEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=jj56wXxR;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E4606A325
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 23:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=jj56wXxR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795129679; x=1795388879;
	bh=ac2bxO4Xse6K+kejCnJOueIlO7M24eds47j2TEmWTxE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jj56wXxRzn2nBMmiU9wnKYSUUcJUspfOwRTLfTWvzZq5b6VIy/GZC1Kj2UpWwb5rj
	 WuvcbH7e5SHyN9U8SZazkBhMO3zAKw8G4qgf8Ds7IGT4blgGR5Yd6pSXD9a42/IQTv
	 ErBqIGBphpP7daHWmr+m9y2dnayCHYJOZflrHnb9sxV80/eXzyXtH/kpWWLzNtGMWR
	 ocwJQmKTDjl00tQOxbaTkzVCHOrx3099dbwlBpW9cS8xDoDaMDA2zAwvR9xPNrPnsx
	 M/96BPZcrKcw2NC0Kszi2Gjy5Kro8gdpfZiVnKY/R0XI4wmZux4bwx+EZh12J/+JZ/
	 +6I7aS/vDkzKw==
Date: Thu, 19 Nov 2026 23:07:53 +0000
To: Bernd Schubert <bernd@bsbernd.com>
From: Yun Wang <arsenova@a7snv.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] fuse: don't wait for a sync-init mount in non-blocking reads
Message-ID: <179512965571.1415130.10806233580012611206@a7snv.com>
In-Reply-To: <5f5d6c24-2bb0-4af9-8ece-d53cc6e612f6@bsbernd.com>
References: <20261117075632.59959.p12-0-arsenova@a7snv.com> <20261116235747.60403-1-arsenova@a7snv.com> <5f5d6c24-2bb0-4af9-8ece-d53cc6e612f6@bsbernd.com>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: 656148638c9aba8ba6a0f4cd5d12ee4e45386918
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/19/26 12:57, Bernd Schubert wrote:
> On 11/19/26 12:36, Yun Wang wrote:
>> +/* read(2) and splice(2) of an O_NONBLOCK device don't wait for the mou=
nt */
>> +static struct fuse_dev *fuse_get_dev_read(struct file *file)
>> +{
>> +=09if (file->f_flags & O_NONBLOCK)
>> +=09=09return fuse_get_dev_nowait(file);
>> +=09return fuse_get_dev(file);
>> +}
>> +
>
> This is just a style comment, for me "fuse_get_dev_read" sounds weird.
> Maybe call this fuse_get_dev() and rename the other to _fuse_get_dev()?
> And both could be in the header file?

Sure, I'll do that in v2.  The O_NONBLOCK-aware lookup becomes
fuse_get_dev(), a static inline in fuse_dev_i.h next to
fuse_get_dev_nowait(), and the waiting one becomes _fuse_get_dev().
The other callers (poll, fasync, the clone and backing ioctls and
fuse_uring_cmd()) switch to _fuse_get_dev(), so that only read and
splice change behaviour.  _fuse_get_dev() itself stays in dev.c, as it
waits on the static fuse_dev_waitq; only its declaration moves to the
header.

_fuse_get_dev() then sits next to __fuse_get_dev(), which doesn't wait
and returns NULL, so the underscores don't say much about which one
waits.  If you or Miklos prefer, I can call it fuse_get_dev_wait()
instead.

> Besides of pure style comment (and Miklos might have a different
> preference), looks good to me.
>
>
> Reviewed-by: Bernd Schubert <bernd@bsbernd.com>

Thanks for the review.  I'll keep your Reviewed-by on the renamed patch
unless you object.

Thanks,
Yun

