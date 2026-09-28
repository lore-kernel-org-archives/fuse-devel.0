Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA03D36F901
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587179; cv=none; b=hozKML92ekOu9IiHP8TqlfGt0nhtp+pKgR6yBZ97ErpupznkNnxJ+g7RLN049/f08iuIthXkPuCXkZeMEaKjQJ1qsLyHNHmLfb29VeTHcVX3diDDZF27uPTvO0vIB7Zx1oirMZ3RPwfMvN4aDCo/RfF87Gc1iExNeGBZKrvOTC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587179; c=relaxed/simple;
	bh=cyKTj7roclfOeH3Mac4a4jqRaIVI3UYO1vNLBKnGZ2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeVB9QJGEteeq7jOQmxdU2OQM/F9IJ+SpRgGVxnGWiR5RpKJLXoE/8C0iwShR/F0Wp4jB1t7Dl/u1hb7C7GwCYLVjv9c0m+h1GvAGTRMOm8tYl79XLUSC2/UyH7AOyojOnieXFW34ws2KI+0lyVIBhIvm+JHMPvKbMR3st+WHgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=bpN9BQBD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mqJE42ww; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="bpN9BQBD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mqJE42ww"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 923A8140008E;
	Mon, 28 Sep 2026 05:19:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 05:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790587176;
	 x=1790673576; bh=4/n14dzpwFiDcI5IgN/vsDUft/HZfcU7hMG9gugcLko=; b=
	bpN9BQBDD98CSvYqzSNIdSsovJSt3wAgYFhaRm/lK16ieijdHiHXinHAUUHX4P1g
	c3MNUNng7BG/34XF6BbEhPnI1OcUxZzs8Lt90cHUQqOqiSN27BkDAxnpqRxPCJ1k
	2GDeL2QmG6/TJrpzsyJgSsijxmbE9b5NYJCSKSaM5+n36/WeFt9DH5WZnXjmbedq
	JxsbJs9qDl+8P6Ym9W7aSZAOjbDxUEUPwvKNTOTYNGIPzc4PmNWvPAeiQH/GbTLb
	1wZeGd+frS0Sz+YCundJMMq0xb+CYGeOPjN+OhdOMl9hlL+b/+ZdbxC6/p/wmgt5
	goOuKA9rgtIjzb5sHqL0Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790587176; x=
	1790673576; bh=4/n14dzpwFiDcI5IgN/vsDUft/HZfcU7hMG9gugcLko=; b=m
	qJE42wwryhNt6j9W94AY7hsjlnhy4ZyHAQkOHPT8h/icTO7/MLLk4fUwvFMmwMhI
	JEcr4fGsEpf6N0sINWoelPkt88lz8CXUP4HPyZ1QHpZLFIpwtJRxHDmGzoqc/D3x
	bdqH9UPLb5fu/5g/keZmOEVHXu48tfJCFZGkEigjmnH2HDe3zj2656TSpktijC/W
	wFdWCuBMPBugRQxR4EZq9xIx0Vd7EBJkUzs3otTESOx29BFuoOu/rCfcBWtXQQLv
	qWiGnMjdvt02/vhA5pOaHvv7cyRPQR1OA3P3/Tp7Ca1HeV5MTcbQ8BnHdG1wb29r
	8OssAOEFPvo7AmVX86BaQ==
X-ME-Sender: <xms:KDG6asql0L1pn5A8iTcxE_JBzOUlaLQisqH_R95eDKS7NnR9t7-J8Q>
    <xme:KDG6aoqylSGwevQPJ3V0ZuvrNmCYFePi6q2clno2CI_oRYy_Y6Gup-jTUUTSIeO2B
    oqkWUC0reGmhxkD6lU8YkjMp-L42uwH3FV2yXzlEFc9d7HgQhb7>
X-ME-Received: <xmr:KDG6au32pUI36aV_P71etfk0Kzzdb0uKx6Hp0SsHP0t11dUeBg9RPJyd4nKEhE7IRhgeMi2w4xIyu1WHwPlSCB2F2sZRCfk0L7ExXScEtfIVgZs4pQ>
X-ME-Proxy-Cause: dmFkZTGjTxxejuXNxXBpdA3Cjq03yu5PK6LODZIyeNUZfUHDkzc1edTgUlZn4ha4nuvFgy
    jNhdWnwhB0XF/8Jp1QF+o8XoI2MmG2LJgbOtzjEaakE87LNSkjTMJU0b7wt8rPWjhXRkLk
    EIpOsOwoIiHaAvGmjrPM4dSJ6TQ8omwbFRQE9Zigm4QpVB4xlnrk+o8bN9UM+1/5QpNyaP
    lMnEVJ0DuY+vc1BT57OJxKoRli5bWntKOb5F7cAbosEJ+WhRLB8e3BBr7jVjf3/v7zsgEg
    un0aZCj6GVcgjkvdDbg+1/Uk+qTcyIwHXREEj0Cw8hX7ckF3H82bSsxyJOct9iguvGSDC6
    Pd9XVdETieSIkPTAWpqDLxEvdBFzDnk21KL5VcmLrkUq0LuOaQDceTpoImw7cSV8bRNCo1
    oyPPYQQQgAOEiZPwlx2iqjtUT1ROAnUZzmj4yzWpZ7KXoWrwsRjrEoRsLhdQOuLWFGTuG0
    V9WadR/NDX/QAd3783wPteWLFyOfK8wqZWGLpvx/Cov3ES3gt4LQkowC7BuJt14iP+vrFe
    uKJljEpz4gCCeVoZu1XE7VfNqYUbLA7cHMC1vAlYS7UaUsLdKXgvgkegrmiorlHlBT/KZy
    ejqma47lN/Qz/l9aiKEMPwIbD33wa1eOjGLAk5fidCJ/heFAE+QPStETCbgg
X-ME-Proxy: <xmx:KDG6avBZ2cznwxNEqS3v3-0cvDNGLBhiB85bnGBMRXtwhm_71ORMBw>
    <xmx:KDG6audoX3IpxgnGA2vZkEZtJTmNzOqOLfJ1VIp8g9tkJUC7Ty_kkg>
    <xmx:KDG6asgfaw8HHln4Dkd_eUAxGT2rYYIG3OR4QhXxCIcDRcigj1mnbA>
    <xmx:KDG6aurqHmfhNNwRAl-ypyMp18n8nKY1K7tAN93Un2iX0vE_c0m0cA>
    <xmx:KDG6agcVjqEapPVwwvWd3fF0V7j1i71yBOBtAJ9RG5_2wzfRdEdQIGIp>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 05:19:35 -0400 (EDT)
Message-ID: <c45e9cd1-5e15-4403-8016-5ce936c29268@bsbernd.com>
Date: Mon, 28 Sep 2026 11:19:34 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] mount_service: open only paths named on the command
 line
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-2-bbf1a84c7995@bsbernd.com>
 <20260925220508.GR6253@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260925220508.GR6253@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/26/26 00:05, Darrick J. Wong wrote:
> On Fri, Sep 25, 2026 at 12:23:30AM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> In a service mount, the fuse server runs as a systemd service in a
>> sandbox that has no access to the user's files. The user runs mount,
>> which starts fuservicemount3, a setuid-root helper. The fuse server
>> sends requests to the helper over a socket. With an OPEN request, the
>> server asks the helper to open its backing file, for example the disk
>> image named on the mount command line. The helper opens the file with
>> the user's credentials and passes the file descriptor to the server.
>> fusermount3 opens nothing for the fuse server except /dev/fuse; the
>> server runs as the user and opens its own files.
>>
>> The helper opened any path the server sent. An attacker who controlled
>> the server could use this to read every file the user can read, for
>> example ~/.ssh/id_ed25519, and the sandbox did not prevent it. The
>> helper now compares the requested path with the arguments it was
>> started with. For "mount -t fuse.service_ll /srv/disk.img /mnt", these
>> include "/srv/disk.img" and "/mnt". The helper opens the path only if
>> the string is equal to one of these arguments, so the server can open
>> only a file that the user named when mounting. The helper already made
>> the same check for the mount point.
> 
> Hmm.  In general I think it's a good idea not to let the fuse server
> open anything in the mount helper's filesystem namespace that wasn't
> explicitly mentioned in the CLI arguments.  However, the simple strcmp
> check will exclude too much for fuse servers that receive paths via
> mount options.  For instance,
> 
> $ mount -t fuse.ext4 /dev/sda1 /mnt -o journal_dev=/dev/sdb1,ro
> 
> Here the user mentions /dev/sdb1, but arg_in_cmdline() will never find
> it because it's a substring of the last argv[].

Thank you! Next version adds more logic and an admin config option in
case the logic failed.


Thanks,
Bernd


