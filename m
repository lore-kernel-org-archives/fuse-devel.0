Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305680;
	b=5hR83hsD0aaStEQ99xe6tFGAprK1lmLV0VwMs5+pHkNx+XFbwPESFlXWpo28+EIePSdZ
	 USW3apIZlOEjoJQwjyltp1gIVCHAsuEnZQ3H556aKCzqAEx5OoetPhZlVypWeLgCtG8qA
	 1fNLkekwaw6CiobhNjwEK4epW+VIOcdyR1m6mwkvO3H1CJOvmQXXFNEEaiWbS6fo4ZTYG
	 GRxWc1GzDuHHivMp6VKQLgeVURAM4ymgMl98+B4hhDKHGf4OXV6PYArxZFZc+B88faRqA
	 PyZCBLfXpkvAB/M7tUsIWhqr3kOtLvMIfONfk1Lyopon5eK4Sneio/6L7MJuoHOHLiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
	b=ypS/8Ba+IFGmdlvmGnM8E00/DYUhmvcsVH2+lTI16G/QByEysBoI72ORBM2N25Fyvub8
	 hJVPKPsPmEacvUsWcwGxa9Wa+AybnOWGvnGlG8zoaizyYkNr9XS32QNEq4JOG7NlujrcY
	 CBqfW97Ta3835KoC1yuttQC91SkDLNuLPmagRLyWmafm3TwdZoCqKJLciQluvFLKPLTh9
	 Mkt8eosK4oJIPROPj5jMtLXWtLSSJNtypellC5axLic6t3aO4SrwQHXJAX0ekW1uYN/V4
	 cc9Voy+D4NjbafaeWLWMb5IPFpMM6xAfk9iRKGExkxtxh6UW/mwu2GCkI/1GFVTrISQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDdNrRSV;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E158606AA44
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 10:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E158606AA44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDdNrRSV
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso2116652a12.2
        for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 02:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794305678; x=1794910478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=fDdNrRSVNR9TpZFUkHd2W1DuQHlvVUFibD6nEgoFL9wl5DSEDU143CIePeWmKV1eNo
         p2IeaviV4vP3RE1b0IAwmilqzagyYiEqwzgjXQIZxK/IRPy+x1ioxTws3516Ab/ZvS9D
         sAWqIxu2pfvu3ECnuFJ9J0QHkyT+t9gw05wbYDp7ttMZ6IzrNLgFSLMmxvohKdw2HI49
         PET6BrCja6mmQXbqqc3OHaaNKz9cPz28KJEow3UjQ8JYrlPXmEOjwVp7EDGjm7QVPcaO
         AqzXADEZQO9jfCT01HjEy0+su4njKuWs6asogL8j5zkyMWKdZi4vnWrQqpQ8hwcBKO51
         2pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305678; x=1794910478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=kaTpdef5fsn6/ERMakmyujcRfIRTE7snnArWa7tVu/LziXYnZJG6V5Fn4PvY5m2fz/
         Ku7dt9219xHFXN4BnG7PrVv0YvtGGjCywFgfxG/ZleuzutZBp19VcYJMtcEegUEnU3DI
         VOxNNMJwvwWA438N0Jqqu38G+Orbh80Vpg2Nm9AW95gzCOdYZs/ofqWOXqVl3URU/P7H
         M4TSt7WgdZpmyTLjoaT35nzcdDnC0TuItv8z2+XMixMcaBkUrV4OoFf7P3iE0QqoAlVg
         /5WkEgSkDBTeYcvJIEz4FpuV/Be0k2m6QLT5payVPgCuVoo88h39ET+WBoWb3u2uoDUp
         otkw==
X-Forwarded-Encrypted: i=1; AL+hErEdKfwEPrhwo0d+CBh0ARxY3ZwiWkQprdm8IZoUzVcN70mWLWCLvvJsVJ95FkMI+5plaZLRz4du3rdZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/UPOIbV/UixjuqhV/fEMNRJx1/6C1RoNxW+2Ki/t+dkmGS+zo4
	rK0Z1bijBQHFeZzDz5C9mRX03hszFA1UE3gen2Bblyzr8Lfsv6D9STZA
X-Gm-Gg: AYBFou178PPmOEfxh1xLP/iy+eYq5G6pStQTYSAl6nFuGwwuh/Ep00JUX7O+w3LqpsW
	nfP6wlOROTIktEOJ6a0UCeOjIyMZ+W4zExazwLqNaN7PwhgniQagtRfXj06ZZkUZw8Bd0HiPJ+V
	cp9g6WLRUTBvKSBBlLjC9ZnMfV4DZ3Tj1MdPsJFhMCfykvZeK7xwB4iD8OrRw0nJ4x8FjFLafxz
	U1fMwpzd2o+kFbiG2e5EqLBCe3iOxLkFONCFNK1hVZfVjiho8UDzarRUHU4jSpI5tUoF+Yu/u/k
	W9O4UMtydDsds0J8lldbeHx2PiMHcx8Yg9glHsBxGKqUsmmp2wntI9S+/oMskQcvkfmMW4+3T4a
	wO8SmITwR/QxLsOPGsEvl3XPmtbNCkqFEZqMp9Ur9eM4ZdgPHHnFivC8QiqPUzWUlYComwFnyP4
	DfoUWpCMOtWLF0VOdmhBX9FZNJed7HMq8tVjtkonhlj9Z9wwhegbmum36C1HkPnG9bYUXs2/Fin
	w2uZJ5QsXAhMw8fo+/ychx2ycZsBwA823CHHR9o3nZUkm82QTlgum8UZLjfCmi8MyXMtIO/sv4p
	UlMeKKGhL7JOhxbonnig3ugMnYUux3Xwuo+HygUG6Rqxxdihw00LK8rxIxz/QD1tiqr4RZY5P0e
	0jWBQ4PSP+2xL
X-Received: by 2002:a17:907:944d:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c504963ce05mr189793966b.44.1794305677695;
        Tue, 10 Nov 2026 02:14:37 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a593eacsm90433466b.36.2026.11.10.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:14:36 -0800 (PST)
Date: Tue, 10 Nov 2026 11:14:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avLui6Mpf8GbKbtc@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>

On Tue, Nov 10, 2026 at 10:14:54AM +0100, Christian Brauner wrote:
> The fuse server can register any regular file as a backing file. procfs
> and binfmt_misc files are already refused by the stacking depth check as
> both set s_stack_depth to FILESYSTEM_MAX_STACK_DEPTH. sysfs and the
> other pseudo filesystems aren't. Reads and writes of the fuse file would
> then be done on the pseudo file with the fuse server's credentials.
> Refuse files on pseudo filesystems just like loop does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/fuse/backing.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 8c21a8a74efb..4e4fb810ddaa 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -147,6 +147,9 @@ static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb,
>  		if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
>  			return -ELOOP;
>  
> +		if (file_is_pseudo(file))
> +			return -EINVAL;
> +
>  		fb->type = FUSE_BACKING_PATH;
>  		fb->path = file->f_path;
>  		path_get(&fb->path);
> 
> -- 
> 2.53.0
> 

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

