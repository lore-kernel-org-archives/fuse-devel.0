Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793389710;
	b=ojkikigR3YUERFwQ833YkcvJn59PxOVIvtayxSHDrvZBDO5ZpD2KfL0Z36egBlWahg7C
	 imyc8KE1lydmufdxGYLp4lwDVVhw05cELHuK2HuWxom1J7vhZ/vrQ4ORAv37Bl04Itxjd
	 3H/akLYRlL61DMGcTOQIDsltnBroMiKaO7N+cOwPetgdvq2+9sk34QfQT9zGVFvPqUJBI
	 hsIFhD85FQu1pFDnuQrGMZlwgAchkBe8HO2hpOHHHXw8kAFj+sFd5XqL3ay9nheCJquxs
	 sOahv88ipGg5h84N2URVyMBe6AOhH5rU+bQz6t2s4xn1Q42HsGngR4ZTz55npsEh/MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B3QeQKv83CCubBRhLwLfDBWq4r5yqUeetrN4Gz6lflQ=;
	b=SLLOAbvyVBU+EJ/5MJslISG0oCwoe8MYKhnyfUBgQZE049Yg2Sw9ODNjTttVv0pg3xP1
	 LKOxlzVaK957DLg3GHoy+NTDPstZ7Gk4HoyGI1BFGs97OTUwQI7/PLXM4J6JFfsiimwyv
	 z7HUvJKcewDVHiN0kwJK3ZnIMaM6TJcGO8hMLvxiqhjnH/Nwiwpc3NAe31Fk0koFGtR9P
	 hbnDKRJlJAd4l6TDMRvgrB2jawBTirD8ZhBREk4OSjaJfzH0akk0oG4uu3bQreZYsUKHr
	 plrZ0aIkMgPTL+U5g0wDufEsjJy2CDTL43cNZt36TZgmb0pqwo3pBWM9xRcf9FtWubg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDS+MOjx;
	arc=fail smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6528606A31F
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 19:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6528606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDS+MOjx
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e00eee27dso644698f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 12:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793389708; cv=none;
        d=google.com; s=arc-20260327;
        b=Nd+nmyia1McIr6YCJ0Y5HxQM1iidreRm6K2d5q25ilZkUpGayuIa64ZDuMf8/dBRYl
         BcHuWmTJLqgfrNipf75ImmxKfcUr2TEQvXszoD6XdLO68QkHTN3Tvn2cv9HAhQ2hgOUb
         sYRcx1b5nqvIbov3P9AWP8pCO8ZtGYgGWCEybneYhMx/DN3/thpEUbnm7ESiLlGFZAeP
         gTGpcrosfobDH+3sSheJyNVXzwtJvkobjJClN5VntbqULwW+83oLYSlH3tsoPT8/9Yy1
         mCKjIt4UWH9T5eVUA1BzvrbRlcgXaOfPzRJaKh8wuTasugMkUOkaejRPWDbYuMGCT7Gs
         mmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B3QeQKv83CCubBRhLwLfDBWq4r5yqUeetrN4Gz6lflQ=;
        fh=KSsDjf3TjzMsGMkz4036cFjJj1yFm1ediiZviz9xrxM=;
        b=D66eNM63NGDg9iCWrv+A2PyVv/SAS89NJ17Kwgkh/oRLAqEvtiI/qP7k2xGuEi11UA
         amtzJr0E/RI/84C0Oq0PZ02SwJgK4jYewz0cu1e4DfuPDstPpW3CXiWISpMaXTDyRHjg
         NAdB2z1nsbzn3b3gtiqjZRuY29a4PqU80/vccd8UnOUKHz8iqlMSsmf4JzX1mGVaXv7I
         dsfXbvqELkFIe53IT7h13kP02Z9O5bqwjPuGrM1YUkWi8v44HdFDvuaKfuh37VcfsiMA
         nllvVosYarmbpm3PhdUI6rAdLHRRl4k9g6wVENM4BYhGpctAAApu7rxKTna9NFcK7fB0
         dKgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793389708; x=1793994508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3QeQKv83CCubBRhLwLfDBWq4r5yqUeetrN4Gz6lflQ=;
        b=XDS+MOjxaGufsGaFWE+cD6ZwSmF8nrMloa/6xTG8n+t/lJ6ELO2dDVwiWYs3SWGp0j
         n3pZrBwy8YdwKfaMNzdAmupyxlKtl3yGxuSFa8wfIMdlk6viULwG3+IRcA5ZPEDgcRat
         1ebGyVt6b+wrJMA+6b01ICYBAw/SslTocIUp+AEHZasB5Ky3FcEPsSXlRjw5hJOUwowa
         NQfETsHV3kjEEjWIsmD266z5aPxyY+/FCN3jAHkl0iR6D1hfqlMbohRQ7XusKm27UVeA
         RqOxsDR6IxIVkd8h0cx1eNhKGy7ulYYtVpC60BUzTyzVUN7uG+wfbrrdPDoHaLRbhj++
         sIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389708; x=1793994508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3QeQKv83CCubBRhLwLfDBWq4r5yqUeetrN4Gz6lflQ=;
        b=TDmAJYFBMpTxHdUuyYRodm/akW5R+2xqTO6ZBjYwym/q2HAgGlMEMFotp7OIRTbbjX
         tZpV5ykDFivkn0w3a9jTLRq/FbpgIusJVxTTj5kknczLQrqSwHrpyCbEXpWlAfWbBaF4
         JwBcmshWJkHeU/z42DbCQlZPx1Q07tjaNiB8muHzSkTloLFjfqvnD0EAb8bG9XypRUDU
         ToE7A7h0zX1FM322xZdDVlZ23uwF+gsmOZeMiC/pcjGY4YdD805dWjUjLTx0l5mBBdKf
         lxFHthRSS8XarDlKmwuzDPtgVGAsFnyYvvQwLfR8asRx+F0e4aGz4RjJR/T0cSfk8+nI
         XTFg==
X-Forwarded-Encrypted: i=1; AKwUvBxNSxKDyy4jUMa7A/01xp93hi02whlmukYqFpjsG9+5CJgRS1C08nJSOITRVAaV48QaFfwRJ0PQOgMS@lists.linux.dev
X-Gm-Message-State: AFq9FYJPoHOoLvM8IPr0JZ0YfaGMkKnNdOvv01R6Pol6dwQNGWsL2ikq
	CIYMmo+gj46l4NqOUoW1P7m1fQu6R1KEklzIQFAogY9FUFtnddmN6b8Kt4JBnyihyAQeV9BNJIY
	le9v1kmcfGQH1AgmAALf1EezVObqh2Gc=
X-Gm-Gg: AYBFou2T0QpZbSryKL1CEc/jEoJCT8BBNNccF8ZMQmQaoOD0K/BYQuabBlKWIwz18ot
	wQ7I4rTPzcVImx+1qTo4n1I1470FB064tRvfD8DxFlf4kZDpzeOpuFHf8/bQyn6rAg/XSrZdUsG
	0EVAZn/rwOvG4OBLa2hftT/0Kks8M5AQyvmWf4tSFbeQ5WM1s53y70EYV3yDGtIIhBqmA7pTs9O
	/fgjumH8gZfxQilzZXQXM5XByiM/HNImFkU8BtqXezwhlARXwSEOKv/35o5RfHcUO7rjs5Cmi2w
	/YW8dHbwUZuuFN14cQmD+BRR9UtNhlIjqbLPUSAS7wa1j/n/AMarJm8yOxtQXAh4yFBBruAA+Uk
	fazpOlV4/jBRw7ctftBrETVrgeiX2BbsOihjho+Vnsia6vXMoEzG6dKXJqVoar2r+c2A9VYakjW
	AIAOjbxAFzNJrXXZfnWg==
X-Received: by 2002:a05:6000:40ca:b0:48c:5304:5e50 with SMTP id
 ffacd0b85a97d-48e6e2620d8mr8708785f8f.0.1793389707952; Fri, 30 Oct 2026
 12:48:27 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027215326.2693300-1-joannelkoong@gmail.com>
In-Reply-To: <20261027215326.2693300-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 30 Oct 2026 12:48:15 -0700
X-Gm-Features: AclHuK9oCK5VP76Wbek63tch4M8ewVUH28c6PHPAdmsJkgtv-kMhmrFiNwyHte4
Message-ID: <CAJnrk1bqPCy8ryVjCsUWR2+4jkNE8rJJU2bUFsO3Q7nznsF7xA@mail.gmail.com>
Subject: Re: [PATCH 0/5] iomap: remaining patches for iomap_iter_next conversion
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	"Darrick J . Wong" <djwong@kernel.org>, changfengnan@bytedance.com, kbusch@kernel.org, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	David Sterba <dsterba@suse.com>, Gao Xiang <xiang@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, libaokun@linux.alibaba.com, bfoster@redhat.com, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	linux-nilfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	Zhang Yi <yi.zhang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:58=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> These patches are being sent out now in case anyone wants to look at the
> preparatory patches or patch 4. This series applies cleanly to both curre=
nt
> mainline and next-20261027. If anything conflicts by the time you pick it=
 up
> at the end of the merge window, I'll rebase and resend.
>

I pulled in Linus's latest tree (commit abf8c33470f7) and the series
still applies cleanly with no conflicts. It also applies cleanly on
top of next-20261030, which includes the remaining btrfs, ntfs, exfat,
ext2, and gfs2 changes that haven't been merged yet. There shouldn't
be any conflicts between this series and anything else going in this
window.

Thanks,
Joanne
